ESX                   = nil
local PlayerData      = {}
local base64MoneyIcon = 'https://wagecan.com/img/dollar-icon.png' 

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

--

function EnableOrganisationMoneyHUDElement()

  local organisationMoneyHUDElementTpl = '<div><img src="' .. base64MoneyIcon .. '" style="width:20px; height:20px; vertical-align:middle;">&nbsp;{{money}}</div>'

  ESX.UI.HUD.RegisterElement('organisation_money', 3, 0, organisationMoneyHUDElementTpl, {
    money = 0
  })

end

function DisableOrganisationMoneyHUDElement()
  ESX.UI.HUD.RemoveElement('organisation_money')
end

function UpdateOrganisationMoneyHUDElement(money)

  ESX.UI.HUD.UpdateElement('organisation_money', {
    money = money
  })

end

function OpenBossMenu(organisation, close, options)

  local options  = options or {}
  local elements = {}

  local defaultOptions = {
    withdraw  = true,
    deposit   = true,
    wash      = true,
    employees = true,
    grade     = false
  }

  for k,v in pairs(defaultOptions) do
    if options[k] == nil then
      options[k] = v
    end
  end

  if options.withdraw then
    table.insert(elements, {label = _U('withdraw_organisation_money'), value = 'withdraw_organisation_money'})
  end

  if options.deposit then
    table.insert(elements, {label = _U('deposit_organisation_money'), value = 'deposit_money'})
  end

  if options.wash then
    table.insert(elements, {label = _U('wash_money'), value = 'wash_money'})
  end

  if options.employees then
    table.insert(elements, {label = _U('employee_management'), value = 'manage_employees'})
  end

  if options.grade then
    table.insert(elements, {label = _U('salary_management'), value = 'manage_grade'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_actions_' .. organisation,
    {
      title    = 'Patron',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'withdraw_organisation_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'withdraw_organisation_money_amount_' .. organisation,
          {
            title = _U('withdraw_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_organisation:withdrawMoney', organisation, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'deposit_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'deposit_money_amount_' .. organisation,
          {
            title = _U('deposit_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_organisation:depositMoney', organisation, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'wash_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'wash_money_amount_' .. organisation,
          {
            title = _U('wash_money_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_organisation:washMoney', organisation, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'manage_employees' then
        OpenManageEmployeesMenu(organisation)
      end

      if data.current.value == 'manage_grade' then
        OpenManageGradesMenu(organisation)
      end

    end,
    function(data, menu)

      if close then
        close(data, menu)
      end

    end
  )

end

function OpenManageEmployeesMenu(organisation)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'manage_employees_' .. organisation,
    {
      title    = _U('employee_management'),
      elements = {
        {label = _U('employee_list'), value = 'employee_list'},
        {label = _U('recruit'),       value = 'recruit'},
      }
    },
    function(data, menu)

      if data.current.value == 'employee_list' then
        OpenEmployeeList(organisation)
      end

      if data.current.value == 'recruit' then
        OpenRecruitMenu(organisation)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenEmployeeList(organisation)

  ESX.TriggerServerCallback('esx_organisation:getEmployees', function(employees)

    local elements = {
      head = {_U('employee'), _U('gradeorg'), _U('actions')},
      rows = {}
    }

    for i=1, #employees, 1 do

      local gradeLabel = (employees[i].org.gradeorg_label == '' and employees[i].org.label or employees[i].org.gradeorg_label)

      table.insert(elements.rows, {
        data = employees[i],
        cols = {
          employees[i].name,
          gradeLabel,
          '{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}'
        }
      })
    end

    ESX.UI.Menu.Open(
      'list', GetCurrentResourceName(), 'employee_list_' .. organisation,
      elements,
      function(data, menu)

        local employee = data.data

        if data.value == 'promote' then
          menu.close()
          OpenPromoteMenu(organisation, employee)
        end

        if data.value == 'fire' then

          TriggerEvent('esx:showNotification', _U('you_have_fired', employee.name))

          ESX.TriggerServerCallback('esx_organisation:setOrg', function()
            OpenEmployeeList(organisation)
          end, employee.identifier, 'unemployed', 0, 'fire')

        end

      end,
      function(data, menu)
        menu.close()
        OpenManageEmployeesMenu(organisation)
      end
    )

  end, organisation)

end

function OpenRecruitMenu(organisation)

  ESX.TriggerServerCallback('esx_organisation:getOnlinePlayers', function(players)

    local elements = {}

    for i=1, #players, 1 do
      if players[i].org.name ~= organisation then
        table.insert(elements, {label = players[i].name, value = players[i].source, name = players[i].name, identifier = players[i].identifier})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'recruit_' .. organisation,
      {
        title    = _U('recruiting'),
        elements = elements
      },
      function(data, menu)

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'recruit_confirm_' .. organisation,
          {
            title    = _U('do_you_want_to_recruit', data.current.name),
            elements = {
              {label = _U('yes'), value = 'yes'},
              {label = _U('no'),  value = 'no'},
            }
          },
          function(data2, menu2)

            menu2.close()

            if data2.current.value == 'yes' then

              TriggerEvent('esx:showNotification', _U('you_have_hired', data.current.name))

              ESX.TriggerServerCallback('esx_organisation:setOrg', function()
                OpenRecruitMenu(organisation)
              end, data.current.identifier, organisation, 0, 'hire')

            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPromoteMenu(organisation, employee)

  ESX.TriggerServerCallback('esx_organisation:getOrg', function(org)

    local elements = {}

    for i=1, #org.grade, 1 do
      local gradeLabel = (org.grade[i].label == '' and org.label or org.grade[i].label)
      table.insert(elements, {label = gradeorgLabel, value = org.grade[i].gradeorg, selected = (employee.org.gradeorg == org.grade[i].gradeorg)})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'promote_employee_' .. organisation,
      {
        title    = _U('promote_employee', employee.name),
        elements = elements
      },
      function(data, menu)
        menu.close()

        TriggerEvent('esx:showNotification', _U('you_have_promoted', employee.name, data.current.label))

        ESX.TriggerServerCallback('esx_organisation:setOrg', function()
          OpenEmployeeList(organisation)
        end, employee.identifier, organisation, data.current.value, 'promote')

      end,
      function(data, menu)
        menu.close()
        OpenEmployeeList(organisation)
      end
    )

  end, organisation)

end

function OpenManageGradesMenu(organisation)

  ESX.TriggerServerCallback('esx_organisation:getOrg', function(org)

    local elements = {}

    for i=1, #org.grade, 1 do
      local gradeLabel = (org.grade[i].label == '' and org.label or org.grade[i].label)
      table.insert(elements, {label = gradeorgLabel .. ' $' .. org.grade[i].salary, value = org.grade[i].gradeorg})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'manage_grade_' .. organisation,
      {
        title    = _U('salary_management'),
        elements = elements
      },
      function(data, menu)

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'manage_grade_amount_' .. organisation,
          {
            title = _U('salary_amount')
          },
          function(data2, menu2)

            local amount = tonumber(data2.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu2.close()

              ESX.TriggerServerCallback('esx_organisation:setOrgSalary', function()
                OpenManageGradesMenu(organisation)
              end, organisation, data.current.value, amount)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, organisation)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  
  PlayerData = xPlayer

  DisableOrganisationMoneyHUDElement()

  if PlayerData.org.gradeorg_name == 'boss' then
    
    EnableOrganisationMoneyHUDElement()
  
    ESX.TriggerServerCallback('esx_organisation:getOrganisationMoney', function(money)
      UpdateOrganisationMoneyHUDElement(money)
    end, PlayerData.org.name)

  end

  if PlayerData.org.gradeorg_name == 'boss' then
    
    EnableOrganisationMoneyHUDElement()
  
    ESX.TriggerServerCallback('esx_organisation:getOrganisationMoney', function(money)
      UpdateOrganisationMoneyHUDElement(money)
    end, PlayerData.org.name)

  end

end)

RegisterNetEvent('esx:setOrg')
AddEventHandler('esx:setOrg', function(org)

  PlayerData.org = org

  DisableOrganisationMoneyHUDElement()

  if PlayerData.org.gradeorg_name == 'boss' then
    
    EnableOrganisationMoneyHUDElement()
  
    ESX.TriggerServerCallback('esx_organisation:getOrganisationMoney', function(money)
      UpdateOrganisationMoneyHUDElement(money)
    end, PlayerData.org.name)

  end

end)


RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(organisation, money)

  if PlayerData.org ~= nil and PlayerData.org.gradeorg_name == 'boss' and 'organisation_' .. PlayerData.org.name == organisation then
    UpdateOrganisationMoneyHUDElement(money)
  end

end)

AddEventHandler('esx_organisation:openBossMenu', function(organisation, close, options)
  OpenBossMenu(organisation, close, options)
end)
