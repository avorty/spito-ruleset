-- This file is created only for development of spito-rules
-- In the future we should make something that makes sens
-- (opposition of this file)

function main()
    p, err = api.pkg.get("dbus")
    if err ~= nil then
        api.info.error("Error occured during obtaining package info!")
        return false
    end

    if p.Name == "" then
        api.info.error("Package doesn't have name!")
        return false
    end

    daemon, _ = api.daemon.get("dbus")
    
    if daemon.IsActive and daemon.IsEnabled then
        return true
    end
    api.info.error("Daemon isn't active or enabled!")
    return false
end
