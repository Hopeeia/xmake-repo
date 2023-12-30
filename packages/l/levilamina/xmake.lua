package("levilamina")
    add_urls("https://github.com/LiteLDev/LeviLamina.git")
    add_versions("0.2.1", "ce54196e47dd47896d8d883fd87156d8c0638735")
    add_versions("0.2.2", "d7f8aab16a7c7e9524b46ce48690aa51cd9d4ad3")

    on_load(function (package)
        import("core.base.semver")

        local dependencies = {
            ["*"] = {
                "ctre 3.8.1",
                "entt 3.12.2",
                "fmt 10.1.1",
                "gsl 4.0.0",
                "leveldb 1.23",
                "magic_enum 0.9.0",
                "nlohmann_json 3.11.2",
                "rapidjson 1.1.0",
                "pcg_cpp 1.0.0",
                "pfr 2.1.1",
                "preloader 1.4.0",
                "symbolprovider 1.1.0"
            },
            ["0.2.*"] = {
                "bdslibrary 1.20.50.03"
            }
        }

        for key, value in pairs(dependencies) do
            if semver.satisfies(package:version_str(), key) then
                for _, dependency in ipairs(value) do
                    package:add("deps", dependency)
                end
            end
        end
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
