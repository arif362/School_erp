ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end



    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Schools" do
          ul do
            School.all.map do |school|
              li link_to(school.name, admin_school_path(school.id))
            end
          end
        end
        panel "Departments" do
          ul do
            Department.all.map do |department|
              li link_to(department.name, admin_department_path(department.id))
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
