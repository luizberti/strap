function nix -a action -d "A friendlier Nix interface =]"
    if count $argv > /dev/null
        switch $action;
            # Housekeeping
            case list;      nix-env -q;
            case search;    nix-env -qaP | grep -iE (string join '|' $argv[2..-1]);
            case update;    nix-channel --update;
            case outdated;  nix-env -u --dry-run;
            case upgrade;   nix-env -u $argv[2..-1];
            case cleanup;   nix-collect-garbage;

            # Short Named Packages
            case install;   nix-env -i $argv[2..-1];
            case uninstall; nix-env -e $argv[2..-1];

            # Fully Qualified Name Packages
            # case addpkg;    nix-env -iA $argv[2..-1];
            # case rempkg;    nix-env -eA $argv[2..-1];

            case '*'; echo Unknown action given...
        end
    else
        echo No arguments given...
    end
end
