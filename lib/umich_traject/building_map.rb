require 'match_map'


module Traject
  module UMich
    def self.building_map

      m = MatchMap.new

      m[/^HATCH ASIA/]  = "Hatcher Graduate Asia Library"
      m[/^HATCH AREF/]  = "Hatcher Graduate Asia Library"
      m[/^HATCH AOVR/]  = "Hatcher Graduate Asia Library"
      m[/^HATCH AOFF/]  = "Hatcher Graduate Asia Library"
      m[/^HATCH AMIC/]  = "Hatcher Graduate Asia Library"
      m[/^HATCH CL.*/]  = "Hatcher Graduate Clark Library"
      m[/^HATCH.*/]     = "Hatcher Graduate"
      m[/^HSRS.*/]      = "- Offsite Shelving -"
#      m[/^UMTRI.*/]     = "Transportation Research Institute Library (UMTRI)"
      m[/^UGL.*/]       = "Shapiro Undergraduate"
      m[/^TAUB.*/]      = "Taubman Medical"
      m[/^SPEC.*/]      = "Special Collections"
      m[/^DENT.*/]      = "Dentistry"
      m[/^BUHR.*/]      = "Buhr Shelving Facility"
      m[/^BSTA.*/]      = "Biological Station"
      m[/^CLEM.*/]      = "William L. Clements Library"
      m[/^BENT.*/]      = "Bentley Historical Library"
      m[/^AAEL.*/]      = "Art Architecture & Engineering"
      m[/^MiU-C/]       = "William L. Clements Library"
      m[/^MiU-H/]       = "Bentley Historical Library"
      m[/^MiAaUTR/]     = "Transportation Research Institute Library (UMTRI)"
      m[/^MiFliC/]      = "Flint Thompson Library"
      m[/^SOC.*/]       = "Social Work"
      m[/^SCI.*/]       = "Shapiro Science"
      m[/^DHC.*/]       = "Donald Hall Collection"
      m[/^DHCL.*/]      = "Donald Hall Collection"
      m[/^PUB.*/]       = "Public Health"
      m[/^UNION.*/]     = "Michigan Union"
      m[/^MUSM.*/]      = "Research Museums Center"
      m[/^HATCH MSOFT/] = "Hatcher Graduate Map Library"
      m[/^MUSIC.*/]     = "Music"
      m[/^HATCH MSHLV/] = "Hatcher Graduate Map Library"
      m[/^HERB.*/]      = "Herbarium"
      m[/^HATCH MREF/]  = "Hatcher Graduate Map Library"
      m[/^HATCH.*/]     = "Hatcher Graduate"
      m[/^HATCH MRAR/]  = "Hatcher Graduate Map Library"
      m[/^FVL.*/]       = "Askwith Media Library"
      m[/^HATCH MOVRD/] = "Hatcher Graduate Map Library"
      m[/^FLINT.*/]     = "Flint Thompson Library"
      m[/^HATCH MOVR/]  = "Hatcher Graduate Map Library"
      m[/^FINE.*/]      = "Fine Arts"
      m[/^HATCH MOFF/]  = "Hatcher Graduate Map Library"
      m[/^HATCH MMIC/]  = "Hatcher Graduate Map Library"
      m[/^HATCH MFOL/]  = "Hatcher Graduate Map Library"
      m[/^HATCH MFILR/] = "Hatcher Graduate Map Library"
      m[/^HATCH MFILE/] = "Hatcher Graduate Map Library"
      m[/^HATCH MATL/]  = "Hatcher Graduate Map Library"
      m[/^HATCH MAP/]   = "Hatcher Graduate Map Library"
      m[/^HATCH DSOFT/] = "Hatcher Graduate Documents Center"
      m[/^HATCH DREF/]  = "Hatcher Graduate Documents Center"
      m[/^HATCH DOCS/]  = "Hatcher Graduate Documents Center"
      m[/^HATCH DMIC/]  = "Hatcher Graduate Documents Center"
      m[/^HATCH DFILE/] = "Hatcher Graduate Documents Center"
      m[/^ELLS.*/]      = "Offsite Shelving"
      m[/^OFFS.*/]      = "Offsite Shelving"
      m[/^STATE.*/]     = "Offsite Shelving"
      
      return m
    end
  end
end
