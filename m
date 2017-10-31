Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:7076 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751926AbdJaPSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 11:18:55 -0400
Date: Tue, 31 Oct 2017 23:18:25 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:topic/phy-reset-v3 1/4]
 drivers//of/of_mdio.c:60:10: error: implicit declaration of function
 'fwnode_get_named_gpiod'
Message-ID: <201710312324.062oHRLg%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/phy-reset-v3
head:   a1d46e588cf5f3554d849614ae91db6f30933ea5
commit: 155bdea9cfe35268946786014dc01998acb7edbd [1/4] phylib: Add device reset GPIO support
config: powerpc-mpc8315_rdb_defconfig (attached as .config)
compiler: powerpc-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 155bdea9cfe35268946786014dc01998acb7edbd
        # save the attached .config to linux build tree
        make.cross ARCH=powerpc 

All errors (new ones prefixed by >>):

   drivers//of/of_mdio.c: In function 'of_mdiobus_register_phy':
>> drivers//of/of_mdio.c:60:10: error: implicit declaration of function 'fwnode_get_named_gpiod' [-Werror=implicit-function-declaration]
     gpiod = fwnode_get_named_gpiod(&child->fwnode, "reset-gpios", 0,
             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers//of/of_mdio.c:61:12: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
               GPIOD_OUT_LOW, "PHY reset");
               ^~~~~~~~~~~~~
   drivers//of/of_mdio.c:61:12: note: each undeclared identifier is reported only once for each function it appears in
   drivers//of/of_mdio.c:65:10: warning: 'return' with a value, in function returning void
      return PTR_ERR(gpiod);
             ^~~~~~~~~~~~~~
   drivers//of/of_mdio.c:47:13: note: declared here
    static void of_mdiobus_register_phy(struct mii_bus *mdio,
                ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers//of/of_mdio.c:73:2: error: implicit declaration of function 'gpiod_set_value' [-Werror=implicit-function-declaration]
     gpiod_set_value(gpiod, 1);
     ^~~~~~~~~~~~~~~
   drivers//of/of_mdio.c: In function 'of_mdiobus_register_device':
>> drivers//of/of_mdio.c:126:12: error: 'GPIOD_ASIS' undeclared (first use in this function)
               GPIOD_ASIS, "PHY reset");
               ^~~~~~~~~~
   drivers//of/of_mdio.c:130:10: warning: 'return' with a value, in function returning void
      return PTR_ERR(gpiod);
             ^~~~~~~~~~~~~~
   drivers//of/of_mdio.c:108:13: note: declared here
    static void of_mdiobus_register_device(struct mii_bus *mdio,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers//of/of_mdio.c:130:10: warning: ignoring return value of 'PTR_ERR', declared with attribute warn_unused_result [-Wunused-result]
      return PTR_ERR(gpiod);
             ^~~~~~~~~~~~~~
   drivers//of/of_mdio.c: In function 'of_mdiobus_register_phy':
   drivers//of/of_mdio.c:65:10: warning: ignoring return value of 'PTR_ERR', declared with attribute warn_unused_result [-Wunused-result]
      return PTR_ERR(gpiod);
             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/fwnode_get_named_gpiod +60 drivers//of/of_mdio.c

    46	
  > 47	static void of_mdiobus_register_phy(struct mii_bus *mdio,
    48					    struct device_node *child, u32 addr)
    49	{
    50		struct gpio_desc *gpiod;
    51		struct phy_device *phy;
    52		bool is_c45;
    53		int rc;
    54		u32 phy_id;
    55	
    56		is_c45 = of_device_is_compatible(child,
    57						 "ethernet-phy-ieee802.3-c45");
    58	
    59		/* Deassert the optional reset signal */
  > 60		gpiod = fwnode_get_named_gpiod(&child->fwnode, "reset-gpios", 0,
  > 61					       GPIOD_OUT_LOW, "PHY reset");
    62		if (PTR_ERR(gpiod) == -ENOENT)
    63			gpiod = NULL;
    64		else if (IS_ERR(gpiod))
    65			return PTR_ERR(gpiod);
    66	
    67		if (!is_c45 && !of_get_phy_id(child, &phy_id))
    68			phy = phy_device_create(mdio, addr, phy_id, 0, NULL);
    69		else
    70			phy = get_phy_device(mdio, addr, is_c45);
    71	
    72		/* Assert the reset signal again */
  > 73		gpiod_set_value(gpiod, 1);
    74	
    75		if (IS_ERR(phy))
    76			return;
    77	
    78		rc = irq_of_parse_and_map(child, 0);
    79		if (rc > 0) {
    80			phy->irq = rc;
    81			mdio->irq[addr] = rc;
    82		} else {
    83			phy->irq = mdio->irq[addr];
    84		}
    85	
    86		if (of_property_read_bool(child, "broken-turn-around"))
    87			mdio->phy_ignore_ta_mask |= 1 << addr;
    88	
    89		/* Associate the OF node with the device structure so it
    90		 * can be looked up later */
    91		of_node_get(child);
    92		phy->mdio.dev.of_node = child;
    93		phy->mdio.reset = gpiod;
    94	
    95		/* All data is now stored in the phy struct;
    96		 * register it */
    97		rc = phy_device_register(phy);
    98		if (rc) {
    99			phy_device_free(phy);
   100			of_node_put(child);
   101			return;
   102		}
   103	
   104		dev_dbg(&mdio->dev, "registered phy %s at address %i\n",
   105			child->name, addr);
   106	}
   107	
   108	static void of_mdiobus_register_device(struct mii_bus *mdio,
   109					       struct device_node *child, u32 addr)
   110	{
   111		struct mdio_device *mdiodev;
   112		struct gpio_desc *gpiod;
   113		int rc;
   114	
   115		mdiodev = mdio_device_create(mdio, addr);
   116		if (IS_ERR(mdiodev))
   117			return;
   118	
   119		/* Associate the OF node with the device structure so it
   120		 * can be looked up later.
   121		 */
   122		of_node_get(child);
   123		mdiodev->dev.of_node = child;
   124	
   125		gpiod = fwnode_get_named_gpiod(&child->fwnode, "reset-gpios", 0,
 > 126					       GPIOD_ASIS, "PHY reset");
   127		if (PTR_ERR(gpiod) == -ENOENT)
   128			gpiod = NULL;
   129		else if (IS_ERR(gpiod))
   130			return PTR_ERR(gpiod);
   131		mdiodev->reset = gpiod;
   132	
   133		/* All data is now stored in the mdiodev struct; register it. */
   134		rc = mdio_device_register(mdiodev);
   135		if (rc) {
   136			mdio_device_free(mdiodev);
   137			of_node_put(child);
   138			return;
   139		}
   140	
   141		dev_dbg(&mdio->dev, "registered mdio device %s at address %i\n",
   142			child->name, addr);
   143	}
   144	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--EVF5PPMfhYS0aIcm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICK2T+FkAAy5jb25maWcAhDxdc9u2su/9FZr0zp17H9rY8kecueMHEAQlVCRBA6Ak54Wj
yEqrqSP5SHab/Pu7C5IiQALymemJiV0sgMViv7DQr7/8OiJvr/vvq9ftevX8/HP052a3Oaxe
N0+jb9vnzf+NYjHKhR6xmOvfATnd7t5+fHzZ/7s5vKxH179fXv9+8dthfTmabQ67zfOI7nff
tn++AYXtfvfLr9CDijzhk6oo6O31aHsc7favo+Pm9RcDLA779eZ43B9Gx7eXl/3hFVq7DlUk
xOxKVVfj+58Operu5scPm5gLDMCuLwLt1/52Nr64sAGDicGsmrbbHz+6D0RIitKec6LSimVR
VTCZZCL3DkdSzeeMBkZUOq6yrHRHaRo9DMqySqWcMhUgNyVzVhXQVZVFIaR2JiskZZXKCu80
Q+1INRZCRixNPYPOYyXMNJtvWpRVhEzOY05yZ1k22tU44s7kiKTTqpg+qorEsax0dXsNGH6G
ImqckSBmg+ew1XTKMlJUMo9hhlpVGVneX346h8Dz+8tLPwIVWUH0+4QcvJreaSFmsxTTZYEC
ZFhHJCPeReeMxScsEDn4SrhUuqLTMp95Vp/LissHdX9zOW6blCZ0piVBKTiJRwOrm6FHkpKJ
GsJTQWcxK4YAuVAsq5Z0OoHtAGGfCMn1NOsQJixnkoNoLhifTHVvS6ZEmb0ENgCvpkyyXAND
1cwRHVtSWnpUlZln3YzI9LEqJM+1TYPk0EXzjIlS31/eXfRnl88lsSat6BQ4LDKuqwQAcKYE
EGSyL1DksTlyoBpi6p7iMo4m1eXtzc2Fb/o6Uo+5TyuQEnSyIT/kYVRObFqsIIVEpeUT/5gl
pEx1VfKMTFif7TxiMieaixyWphSP0j6KKlUBp9gGu0qBygopzFlYbwBKlnHhW2U9hBEmkAAG
K4NNmjCSgqQNZtKglYUUEbP0czHRBKZWpWzOUnU/ttbeyi1X+v7Dx+ft14/f909vz5vjx/8q
c9xRyVJGFPv4+9rYtg9tXzgD1UJIS3iikqcxyk7FlvV4qj4CxtZNjGV9xsW9vXR2LpJixvIK
+AuataPFc9hcls9hZTg5ELD7q9O0qQReG5XBgd8fPnTcbNoqzZRvr4FnJJ0zqWA/sZ+nGeRK
i24eRmpnIAMsrSZfuDVDb2MrTFOhNHLv/sP/7Pa7zf+ehlILYqGrRzXnBR004L9Up44oCcWX
VfZQspJ5VlazJGOZkI8V0aDBrGORTEkeu5JZKpbyyG838GB5hjCsMIJmMHCKIIXt9oI4gBPz
9fjz+Lr53m1veyJRWtRULIZntYXUwmlJALTHIiM8d9uMeY4rPQUTEPN8YjGvIFIZ5TwcxYjl
vJtzX0mi3obxc608wEzgmYqJZu1q9fb75nD0LVhzOgNpZrAkS4fnopp+QekE78feBmgEY8VF
zH0qru7FY1vnmDZLPsFWwBFVZoFStfMD6/dRr45/j15hoqPV7ml0fF29Hker9Xr/tnvd7v7s
zdgYVUpFmeuap6cpzrnUPfA5fYZbZJjdoXvxIgUqUwpw0RSi+l0YDQYOrLFWA89Z0nKkfNzP
HyuA2QuAT1BIwGafUKsa2e6uev3NJJCKd4pIHaaYps3uBpGMZ6LYhEaoa/08QQUKPlA+pn7e
zuo/vJoNuydwkngChvv6pPmNga8USVgf58pSmxMpykJ5BwULT2fGrKOcaSH9+47aDg5gz+Xu
3GbjKKBuNUP5cR5VgjaukIzCWYv9rGQpefQwIEpn0HVuDIeMXUMCngkQVqIEzWGpfRn3tDc0
RNAwdlrSLxlxGpZfenDR+7623HxaiQKOA//CUHGZAEjIjOTU0cZ9NAV/+IS1tQqtps7BXvFc
xLatr5FA4ikrjN9iXFbLShdJ91Gfi+47A+PFwTZYDpyaMI2OZjVQnvV+dc32RuIUGogvBDPG
7KSyTh1ngK4eM2/U1vNUaxevXUaawPGT9irBZamS0p5uUmq27H1WBbeoFMJZHp/kJE1iWz3A
hO0GYzFMQ3eGi+TMwtUUTLS1gdySHRLPOUy66ezwBXfEOBZJ7GMN5dVDyeXMkgIYJiJScrOT
nSOMAVHMfERq9xyGqU5msPM96OXFMHnRpDyKzeHb/vB9tVtvRuyfzQ6sDAF7Q9HOgI10kiAd
eV+InNWwytiNWjJatqVlVDu/1tFqIkbjgXail5LIx3cg4KIJPxqJgHVywlpPrk8bwhzGUIFX
EnwqkfkVmYM4JTIGT8KvzmC3NcSF4FuQCjxQnnBqog1/rCBFwtOeRbX3T9QYjm6Z1cGAl+Af
ZVZUMFmWesHlma5mPJNSgGAWTgpqd4rWPDQ3lsDaOO4vxBVOj14YA8JuLCEYY/ASHH/ZEOJw
0DFtAJPTPdCsH/jUrZJpP6BuxeAj6WnJztk1gKkQlu5pHUOIWIx31jijnpAdlLnmyWNre1zy
kk3A94HQ0SQcGmZUxFZJBs/kcArePwDdiUVCvnZUGw3xuMz6fDST7CRgMHtAyTNeuw40KzB1
0cNZMDJr40OYPuqgfnS8ILDhGNHUvnkbe3lmohjFI12B/DoJhFC76TkBy1mk5YTnjsKymv0+
Da3ZgiLEKPg0HqHVU5A/nBl4un3uenzivpAO3eAeRibiZuEFo3juLeUt4jIFucSTgKYNfR4P
fbaEw4ceAEZQuByPAJruRlOBS+Fju5PKO5cHHKbk2kGmfmdVETjGRp598WoKMRJYaTpbgHq0
BhbgAYPlbbIqg3ZCNXdDKNwGCIo69ZIkZzSWmfMc12U4Fsq4COM6kbSN8uViOcjCenBaqxEi
izuiNKgOHSA8AIYzuxatWl6C6BKzPCVypnSdkjovQ8X8t6+r4+Zp9Hdt0V8O+2/bZydGPI2I
2I0dAma6bl99IhvdiEqrTVQGLC3PE9t1hnWgS2YfNuPFqQzHuegdDnvgZv114j4VxOffNDhl
jvBg5xrs5SLgNdrLL14NHYgeT5mk1G9WW0zuj4wbMCo92bOnXUwqeQaTBQURV7OAxxxhTsPK
TEcxsTx/jJcUVRyk46GEuM7xYZtYKlKB2L2Dh5JIXTim2URy/XgW64sI+UeIQbMYnB5WmxAZ
RFtEgagaV4pZ6oIMpb9YHV63eFk30j9fNkfr/o2A5TbxE/jlGK85QkMg2sg7HP8phRDnPIZQ
yXs0MlB57+FoIvk7OBmhfowWrmKhOgxHGFRcxVzNwm5iBjH2slJldH4OSqQwUVUt727fmW0J
9MAssHfGTePsHUJq8h5jQFnLd/dJle/t9YxAUH+Wwyzhfv5iyvf27h361hEIjoBynj1gNHjK
yYqRWv+1wXT+wRJtLupsTC6EnXFvWmPwZHGsIYQmD/bE21x32+HM3UqgJ07gTK9m3PsP62//
OSVtYIXhmVrA2WPkxr4tIEoefOZZ5Zd20shwWxXgAqJJAAfaySo3cHT6G/g5mLfvApQiC3W2
gW5v96KHaPDraCUzK6+OcecXd+l4x7Tk1G9KEMhp8d4dFaJM52fACiw4CQ+xPEccgZi+L/za
HcLxpJiQofJ+Xr1i7sGqnnDI0qkMX9ZnBb25HIfLKBA+PlNmUYBODQIpC9j+Fvgeu++CQz+M
SRwqa7i7MoUYnWYu6N3VxY9Kxr5sh4FeGuig0/hHlcUBR6eB94i68Ot3+gOca7+7auC37/S/
xfFnYfind/p/Cs9fRWZ+fluriiBsljEIUC8DW9Mwu38s724D+9ym6kJw4xmI3C9Bs3lWTUoW
uGaor8PBlBCMYwPzFYm5MMf0R1aInkEoOHUlhoePQj3aFKKGABL2rhaMS78HaLTL3fjmcxAa
1Dt4p15XLIQHLq+qqTYlIOc0weXFbRD8+dMFnOawoik+9cHtFd0oOWz+87bZrX+OjutVE3E5
gS0o8wdfT/70vBk9Hbb/bA7QdKKHzX0SmKAKR5F4K6VOeJh6LdKAK66J/wYMi7vKlF/efLoJ
aO8ctsi/94pnMF41Kdzih26LaNnoi88s6ykMOwm9f0Ef3kk2481oxvw7P/1SXXqL2wAwdutQ
oOXKRe1R8ZO5BzKnWNf4HVOJF63dIYLgjmUFOkG5WzPStM9FCjE7kf7IqcHyuYEQVmcaEz/O
/Yh7PYJfJid4crYwUTQFn8XJuze0FJW8cCLEOpciykDEVXfLuPLdauPYTTrScs6wjm/K0iIQ
4KkFFzr1WTEjxiw39SZN/cNUaMz+edJhC4JOssHqQQcUJPw1dzPpbMn8YkwlUVPDz9AEk5Ro
oN0MY6nSNGUTkrZ1U9WcpCXrkh1NN8u7g4YKb/xwphDW9ZO6eO/jupROc9N10K3N2kxKC5IL
YwLq8d2tb9orTOEYmr4UT5FyXRXajAsaRt1fdyKQFadM3imKnEjSD47OVjq20ibK3M6tm+Ss
Fph8dHZP+crgWvE3qc4MM74w2P31xefbnqLERLaq9LQwJTweSk7l4cxhGU0ZySkBNeBXoFIA
7UXAhNDMX+n4pRDC72N+iUq/Bv9iUmnCW03XqzNLmJRYr6BlSbWpODM36c6ZRYNhIHhFMgsV
egBLkCODMg7LQl7PDB1L8dQXKl2lQsspk6TLyNJkjIQEbeWkpY13jZdgJnN4NpKOetxrNeUS
FgOmTk6YVlatwCAf3Zb9ecKtFqRmHKSlV71o2adTaaGPLVjAzJijJKENCyhMu5/VGYjpjOGB
87I661EzF0peSosH0EgLEOYurR5ObTc3NJZSU6S9tGpTEdHb0TLSrTziHUBsyitOI5tjhJ2b
HL32qZa6lmZi8FKWT7SnBrSZhGVw0ZHMYy4ZSjS1btnQg1F2OSU21BiOl5NGofJ0vIKnU8Ft
PeQMgQh1NZtyGz3lE9DM8ByCAvNvM3TLFA/CwtuKUFnXjrYGDyUqiKt06Y+REMhFIB0AsEKG
p1cQxf36qbHbiDVw9OLNcfvnbrE6bEYIpnv4Q53C/jodAO1/7Y+vo/V+93rYPz9vDo2PfLRR
2O7pZb/dudkCmBccWWOFh2kG6HT8d/u6/stP2WXZAn0VTac64CsUlJJAqIMeioRDEwe84XMw
cCPxtIDg15dHg1WQp3+wRuMJW0wBbmffmgR3c6M1LLaLN99Wb8+mAUsHj6Nv+8No1dJb229e
2kM+wo16O26eutOeigW6DFjbdH/xA5xq878u3w6GRCSJYhqg6x60uRCDFUofGN0EDsfohHDR
Q9CmgKke+dTZNfDDeo6TsjnVMOeb13/3h7+BB0NlBg7NjDkGsm6pYk58BRuY5HZqfDCJ3sft
gq/Up9GXiXR0On6bW38vDQNVZVRhPE/9cYXBqV0xv/2siaCkKR1KKQLHYMd8VXq8Zmb7VdQF
Z5S490/QfpJJCUEG893PA1KRFw4x+K7iKR02orta9EbAdkkCCUJcAS/4OeAEIyiWlf4kVo1T
6TLPA7cXuHizOJ9FfczBjxEz7t5z1kTn2q9bEVrGZ8dElET4w3jcmooE7vIRxpSfHbyeFroA
YbgRm3PcQKQhfEAiw/gFXLRcuc9r+hiGUhAcMdbviyev16Rp0Ta780QuB0+qwZBk8Q4GQkF+
wMEW/pOIo8OfnXr28OWEQ8vILiBpo5oWfv9h/fZ1u/7gUs/im9AdNEiZP+EFU8dHH+jzZUT6
E7C4vELDyClRiif+5bWEQHWbQhlQKVkRiiEAuS7/CZ2kmNKA8IETSbUfJgMJYg3C7M+YaX86
KR0HRogkjye+A15XV6EYKNI/4dDkJTZPSV7dXYwvH7zgmFHo7Z9fSscB7gQKTDRJ/Xu7HPuT
fCkpAp7iVISmxRljuJ6b66AYmdSZf7nUlwyKc4VV6gJf8ziX2LB1xFzle4kJiNfmtdvmZ73C
5yE6aO0gopyFz3tWpGE7mQfKp6bKL+yGK2amMfMvBjHSK3wciAmlc1g5Vb7aLKPAlpg/eazc
kujowQlUsNb5Dz50mBs3afS6Ob72ktpGN8w0BGkBDziTJOTiUuLvFKj7IAmsQoaOclLNaKB6
V0OIlHmqTRr4gmPJo3IsM00mKMmX/rPBowGw5knba7fZPB1Hr/vR181os1t9fcb35+BjZ4Qa
hM7LbFvQBTO1dyYbUnu2VvjOodWv85IZD1xN4tZ8DuSgCE/8AFZMq1ANUJ4EIiBFMOsf9psS
PyxdnHEgYnzj20+xNbCJFObSdeBMweHAo+vpgi9WsfyyweilS2kj+W1cEG/+2a43o9gNNs2L
x+26aR6JfsRQ1uXudda7G8FpBjHU0/sPH49ft7uPf+1fX57f/rTMOExPZ0Xiiw1AQPKYpMK+
uCtkTTvhMjMFNubFkZPmWJgCOq/gY95gYeq1fCn8+m1qLPk8YKYbBDaXgZLyGgGfbjZkqjoH
7zfSiEYwu9Yim2Ju/4l+VNX0Ebg550qESgyat35FiVMM/HSAjYWJEzOkVcLIJk5qvf6u+JgO
2lThZJfM0+4pwZRrVCaJy8FTAu3JiJmTcmgu0IqsCmWL4J88VOOcabcUUseGr4HbVIDCBM2t
MNYhhbHsaiUfGxFH1KVvqj8+kZ+G/Xqlei+rw9E6ZyV8jLL61bJ5e6IPq93xuc5HpKufTvET
jhGlM9hj+7WMaayvTbqjoAN6MgTgQYhM4iA5pZI4cDmaBTsZDorAiz0EBq8TEHiqIgNxq92E
AbMlyT5KkX1MnlfHv0brv7YvVsLL3uqE93fwDwau6OAwWgh4IdyeHFduEo4umi8PZWHh8YkI
OFwLHutpdeluYw86Pgu97s+gB78LsrA/CX+05MG8GgeWhYvnvcWYtrGPTdzvM5/A4ZkbcK7B
hVl6fw2k3YcMLOpAOyAEDAs507HUPO13C1ZgICzwiMoog0j1yseNcGarlxfMwTUSaVwlI6Kr
Nf6cjq0fzawE6sgl7gRGmOFDg2nEzHu5Z0FBc/WXZ9hZzWWVB6yL6Z4S3eODmajaPH/7DfPK
q+0O3D5AbfS8L8NsCGX05sbvaSIYn5IlaehVhpFIOi3GV7PxTVholdLjm7DqUem5HS2m56Dw
3zmwUcNj5EKfUfH2+PdvYvcbxZ0eeFwuDwSdXAW2MccXV4zS/ia27aB2fbc8LUqwWxSIHQ2/
snOvw09kYoYv4/rXH0M8YXQKndbu23lccFdEeGL1sFzNRE6ngXRnhwdcDasdg0JJwHc/YeD/
gdNyHgnPCr6TPo9lflWqdyfnx+KBSMRBKovweGAqEW8gk2kRx3L03/W/41EBIeX3zff94Wfo
8NYdgnJS8LM6pIx88XqsLf/S1U7gZZU514GfQwEo1pNAvMtsAs1vA3lBWB7hPNns2twLT2h3
Cpfh28n9w3cW28+f0SHsETC3jD0iMBL48ei4uGUpAIJQQfp/HKB+zYY/q3T6GSLwgfo//NU0
efo371R8b2TyMk3xw5+ZaJCS8OMWBOOFr1KoGnlxNV76I/cWOSb0862/IK1FKUN1by0ChThu
qJB6SKnzPMBuNYUy5knZ/Z2HuHwstEh7tf3DdcjoPFfyd+BqeXdm9s7PVFmNzbwvb30wk0e5
Gn+6tZZFY/BQMGdF47l/Qvh2G2WvYtqvaU9DvLMiqd7Z+3yeBdImAKgCSs7A6oqWoSe1Pa69
YSXLIVJW+LNQV+n8YhxYeHwzvllWcSH8Gbi4zLJHPMGBzDDJdegF/QTrC/6fsWtrbhRn2n/F
lzNV73xrwAe4xALbmnAKwjbOjcuTeHZSm0mmEk/t7r//uiWMEVaL3apsjXkehBA6dLe6W8y8
2lR8mUoThFkLYyLwXDEZm0WkOGNJLjYlZpQrb/T8qyES1PbEbIYMi0gE/tgNCasuF4kbjMee
BXTN4/fS6hWQplM7Z7F25nM7RVY0GJu71DplM29q3haIhDPzzVDFcQKaTx0zvBGLxjoNS2oY
THxzDXFlgaYHuanwDuqa+U0oSbHrr3GT7Os6dN3+fC77eBwXqHQYgkYUAgPaNfe8K27eBWlw
dOkk9tcbRhrWM5/wl24ogcdqs4DeEup6YmWAwnnwg3URC3MfYIu5M74ZSSrB1emf48eIv36c
33//lEk9Pn4c30E/OaNtBdtt9AL6yugJJpDnX/hPavpAocbaTSWJ6ymPlMfKy/n0fhzJ0J/v
z+8//0afkqe3v19f3o5PI5WmTvNjwR3CEPXT4tb9hb+eTy+jlDNpSYs013nB+NJweQsr2O3V
a0Fr9DWiQHZ8fzI9huS//WqTwYrz8XwCLff1+OcJG3/0ieUi/dy3L2P92uKu356tie2TOrG4
RQIYLjcXWyplWkJaz9x/mU9kVoJIs+nw6LZjYczxRcG9SXorA5LTXFOyypBHmNGuNBq54YaO
Tybe3vMnlNeaLTpzN5TPvLf5NyIDc5XBnHax+MvXaOo/Ov/76zT6BEPhr/+Nzsdfp/+NWPQF
BuDn7ndpxRbzWsrWpYKJqayBc0HlDrsUb7LztoVrvgztVUJzle/NpF9ZRlh7JSXJVytq514S
BMO9174n7LUdq8uc8tHrCqgPyU9/80WX7LZP6Awu/z9AEqH4LxTo8oKIMVKcsrB2UfR9u6Q3
7IgCiFSU44JEpbFd5tmyfKF6tfAU306aDJEWWe1aOIvYtYBN//N2hxr+k8OWftK6IJwcJApl
BDUhCl8I1u8Rki6WCg6ZvXohZ3NrBZAQDBCCiY2Qbq1vkG43qeVLRUUFS6Z5nlfPR6ch6DgW
RslSwsdA4jHUzyVMESDfyGk5i3fUTn7LsQhDLcfeFEXlDRFc+/BMw7Iq7i3tuVmKNbP214oT
+qwaORsBsyAn9nFkHTIbGqW15wSOpQYxaJk0utxUqNIoD3OatooIDVXNmMSir8AMd4yseOgQ
gXKqAarYMhzEPp16zIeJw6xYNBW09Nd7+QEOjkvoHA0pHJoEI+YFU3PMrRo3WNFgblYQlLQh
Cs/yFrto7gSWpqDd95Ugkg5MXkXqjwnlV5Vv6QK5iNSXDs0bxtAJu0sYWj6U43kW9WbcDgME
ykWOqazKMu8m9kKskE4ESk5qfes/Rn8/n39AUa9fxHI5ej2eQcgdPWM+we/HR13TwELCNWEx
b1G7RVkyWLw1DzCJ3uclN+WNkE9YCj39JV6DVmTOzCW+s6wXLlIDdRc80VXRTrNC07TSKLTS
Y7/5Hn9/nN9+jiKMHzM1XRGBDBUR0WXy6feiIozRqnI1VbVFqqRwVTmcuYw1lDRNg8Mewbml
0VKzN5vEMguG+jAndJ9LS9tAYmaU4HZHg5vE8nW33NL4W17FQtwqUMV/b85CdjOiBgpMiaB7
CZYVseYpuIIvZcULfzY3f0tJYGk0m9jwPZ0ASxJAYzN3T4nCmu3NiLD9C26rHuK1S2TibAlm
M5/EeeW7zhBuqcDXlLOSSgUqB0NYbslEI3JExBWdiUQSePY1JBYrRRD+fOKYDVWSkCcROWIV
AUQnapaRBJiH3LFr+xI4U+XERqckoM8oJewqAuFiI0FK/1Ug7jaV6KpuKR4mjxkhdhS2+UOC
VS7WfGFpoKrky4QQngrbPCLBHc8WuWHrsuD5l7fXl3/7c8nNBCKH6ZjclVY90d4HVC+yNBB2
Esv3ty3e6vs+9DMxaB6Y348vL9+Oj3+N/hi9nP48Phq3Z7GcxsGPftCtNnPRZaLb7abutVRl
P49iTDiqXUZXubDULqGAN7654mi+B801c6M26IRy8YhU4BU6l1IEaQ0j0vbRsezt7p75Y6lt
KHrzZrkRvXhoZSaN43jkeMFk9Gn5/H7awd9nk/1+ycsY3bPNZTcgSKyC0EdDxjMcjo0Z1GTO
gSm18Q/tpi7oGCGz5v20zWIYgJSFTG6SGZH4fgOL9wPhTitjuYgdPwxeiiknm5BhJIkR29YU
AncJIqAVFxnQAXLaoxuDCMiKIohWxqqEfxDvWm3MtYLrh61scHn8CVGDLbUvmyXkYWRlP5hG
dTP0g7/ugPSCi6Pnj/P787ffeHqcUPHC4fvjj+fz6fH8+/1060AJ9cK41krvPNs4i/Ly4LFc
c3DY5iWlQVf7Yp0b9/I75YVRWMDco6lv6pKMml32ho2hgFWs9+q4cjxdfjHclIQMk9nJ42iu
Am7CWW5MFa7dWsV6NpCQxZQVpdn7qcTQS6ThQzfriAbpKT7TyHcch9zUL7CHEKIT3HuoV4u4
yXzOjIe7dJ4MAz0DndtcrZKZr2PnyYWujidEfarEbBBAgMgOBQjV1HTI66VuG9D0TU6icqyG
Udw7/wJmF9OeUqfERZmHUW9ELCZmI8yCpbiOE/skWW1uI0Z1rYqv8swsxmNhhLIq8/r3t5+7
N5p2mvQXxobS3jejmrS5h4VbvkmNvQXW60RId6vrC6tLh8rcNVrY/OotbP4GV3i7HKg0F0yr
FznGo943vS0r0uc3FVOccHO6nutdTYTP9UGJS+wVbrIIY3Ht5cUgW8VabP8idgfrHj+gB6bW
EPLKISvw6MQMpt8UY3f6PdtQUh3q+WhcwnC7rY3BqZ2iMLsN5ifR+iE6Sy7T0LTeyMQp9xfP
Pu2OeoVJiNPIeMzdiofZsisEd+qw1hplXZgzt3Vv2IS7mBvLkp7aVySGsrQW72sROkI4HK3M
4W9wfWuOmuM1dQsuGmZkMh74VJgjsdZ63dd04JbGfqDNxNvZxKtrctVLt/0v2IGgaLT9mYfO
3Yqwvt3tTSER3WpCHcMs194tTerJgdp6QoxUMQCdWlGxs8LL3UBtOSv1jd474fuEw76CoFiz
fHwnHnx/Uvd1b/ND85v5I2Ou/5XwFQWwdieADgymdF/qET7w2xkT33IZh0k2IBFmIQhpqVZm
c8ksVQjf892BSsI/yzzL09g46H0vGOvLgns33KTZlkdc2+1QJw/2Rsbtjfmd9nLAN2Zck7qP
yhATZyuuJ4Fcg5wKn9PYIvsY4zCXfEDeV/th3ULvk9CjdrXvE1L+uU+Irw0Pq+PsQN5nTFnR
rSGot+iFrNWRhXOYaUmnsXu4ARZYIvVymQ4ujpj+qoq15d53vIDwwkCoyolsTL4zC4YeluE2
urFXlpH2ccrZeDLQy0tMQmBeI0WYgmyiefcIqYAM9lYRx/fmInkS6onqWeCOPVN+Y+0u3VeH
i4DaFObCCQbeWB4ZsIQ/bXAIwuwB1w9L7FIDI0OkQmv6uOCM3LoGbuAQVnoJToYmJ1HJ2Vl7
gypFYWj442z000LDotincUjsVEEHIPz+GSZiyYgJlm/slaji9abSpjR1ZeAu/Q5+YAUsrCFh
oqkSozjZKW+rz8Xw81CuOZH/GtEt5kHsHTxyW+yOP2R61i515bCbUl2iJXhDa2eNh7VpYou6
IiewhFMZthQnSaCdexOdoYfss7wAZVNTX3bsUCcrapJcRpG5J4D4YDyrCSW+Jii+a5PmNylW
1TWGJ9Nw6umKw6tFSNhDLwUf0k0tM3iXsYW45uj9QrRTsd4nfNHxONjBlcu2dMr5CH5agi3R
ioMMoxGkMdnQhMofezUJQyuhh5kN9+c2vLGHkATGWRjR1WN4MF1G41EIn9tSfFSAWDbx7fhs
3scvXZDXsWxbzR+SFQl8dqpEFWRb78I9SUnQT6pyxo7DaE5dkVijDw3iIP/SHCn+W2EpqNsZ
KA6TDJU0NqQfcm+9vZGAaBzEDGsNcdmjwQpUZcItAE20MHfhWSHU7Y3XA4k3k+MKRq9b4v9t
HwG0qyCYUnvPBeHPZ7YXYWSLTBmjdoa6HRchFhIZ7hG8C3eUPo1wEa9CQWTvQLysEt8hwoGu
OB2QA2vr3CfkfsThj7KWIsyLtVlQ2fUExEtipMPOeEAJ0q+bEakSwk1Ype0VwE+LSxygU0qZ
0wtNu4afLtQxLRvQi3nSAPWMSX2oFHoihHWOkSnmvlhykU5N3lTdQq/mGhMYg7ZKtmkZ6lmM
NKzViExgN76iC4jKfL0i+A/7qKsIdSG5lMZZ1nqMxTIF1mj3jFmsPt0mXf2MqbI+TqfR+ceF
ZVi+d9QmZ1rjzo15kRGR+aZse5u5gb/++n0mY1l4Vmz0rKZ44bBcYuRyQvk1KRLuiVKJ2xRD
yPRkdynRoRQpDfFwsz6pzZnzcnx9uroGam3X3J/jAYPWenzN93ZCvB3Ce0O707R0kgd17128
X+SUp3/nFez1xzy2ZnO/olSYJ5vIYKgI+YatBaw4hD2yqUnvNIyO0YLfmivly66P708y6I3/
kY8u8THXhSoujbZ0Q7C7pHb74ipMY2NsJPtxfD8+njG/dRsVfFm9K01c25oMLZjEOACpsNp3
xrrymSEvNhHZ7nSmvxsIOIRv8XVU5g85ZTc8rAThg4IHOh8EFQ+mnVm02OPWtVE3hW7dS0EA
V+56kfdNhpf35+PL7fZ/85Iy2wLrbko3gK+Oorm9CE8qyhhEjmvObs260GEucSUyJbjrkphy
3zA/S0vK0AWabSYDkpWHjcztNTGhJR6HnMYtxVjvuIYVIaIOTe8QQ1HgYQBbLG3gNftu2t0G
JVx4u9WuXN8n7EAdWprXhFOvImFaC4M7m8qb+fb6BQuBK7LHSCcTg5tTUxSsex5pt+pSrLXG
huvbInSGfnRQ52Kn4/RL/UoMvgYWjGWEktAynBkXcyqESpEar4+vVbjqf3+COkRr9ItCDDJh
mrXBZUGEgChYHidRDD0DfsEow8M3+ArU8YTyxldseSQvoUfA5I1SZlaZJ731lh020YJKBg3a
JEyCUWJMC7neNbnzNWH3clEmd4bVh0pJQh/PVnrBzOxcEBYFOhARt2HqbToLZcXgrzAfBbTt
Z4SB3pDse02q5BOXGSS+bp5H+HGQwol+yjVelqcfVb1ra6DqGWbwci+9fAdp0oOiT+lFbMZK
tSIDBq5/9M/HGIkUr9OHZGgPD/FQN8/s+93iM0KQvuCEg7zE02hOOKg2MDpgkTj3iSgnCVJO
3Qiis7K5ZyGayX0+ImE24IKL6TSgmwXwmWeelRs4mJlnNYQpX+4GK8rc3Bn//Tiffo6+YZbQ
Jivep5/wmV/+HZ1+fjs9PZ2eRn80rC+wzGC6vM/9Dx7Fgq8ymRjW6nLd5xq1b9l9C9bv0Tku
HITug5+GDbh7S1Idku7oqolT6vQVhNUcf9OM8T8g9r7CsgucP9RAOT4df53pARLxHNXYjUs/
q8kpdUhQHidZZb7Iq+Xm4eGQCyLTMtKqMBegMNENU/EM0xYvbt4tB035vfNinX7SfynyzB8J
JiGRj1f1CUzgS2fmaSlhsjLvqV4pvVn3stLpaXMxP8CNbaiDqeSmbSBawUfp8QM/6DXW0KRd
yrQDUl4wL7cI1yo7gdq6Jx7fbHP0a9w4QJJlX4cWSZEnVlF5VRo8thFgCFGJxq4wOciQcjET
kwSQ4HyYCseEHASMGnf/afRmmGrwwz67T4vD6r73mu2nLt7fzm+Pby/NN7/5wvBHmSYQxgRm
i5Dd0emFkFUl8cytCRkcH0IOGFEQmuuaOtqruJVDiqoYPb68Pf5lPAK7Kg7O1PcPDHNq3s53
ysqmNslGaAsiz+TomNuOT08yCTPMk/LBH//XfSQe5Eqlg9+ZV2t1zly4JSKkJIpJ/8zfQOF4
cGFi2mha71LdhVxegIWUOIBLos001uvbSkNTociGqbNNuhXNPYcIDr9SJv+FYs7he6Wkztgl
4rw1jllU0TlmMUznmE9g1jjeYH0Cd0JprBdOBS04zKHiyXTOUH2AM6MUtQ5nKNOa5Ay0s2Dz
2dD3ksYMO6WqC3shkZgN5JfD/G4DNeHTOxDAiQPSG85yPvXmUyIy+sKpYAXe4DGOdt4qmTo+
aTNoOe54iDOfjSn7S8uwf/A1X88cQoC/cL6yib0QmJdKxx34DjLyj3KLvXAq5gYTe9eSnGDg
WRWbOIQXapfjEsG+Gse1v7zkDNd54hK+qTrHXuc0rB1KS+xyZuOZvUKS5NjnOMmZ2edl5ATz
IYrnzAcaEVMEzrzB+sxmAz1RcgaSSUrOf6r0QC9LWeENLUoVmxEnPl2nU0ba/ZqekRJ2hyth
YMoGwmAJAz04ndtbDAj2rpKkVK6aK2Gokv5QJf2hSg5NHLBkDxGGKhlMXc/+ySVnMjA9SY79
fbMKtOB1XKaczl1yobJq7lPaSYcTjO1VL9jSnwaEcJtSBtnL3WJdDYwXYHhEPqIrgw2UYbFZ
XThxypwJkba2w3GdYc5s51IZiC4VSgWbzFNnoG8Jtp7OQBG1ZM9vqVUl5gMLnEjT2cAyAHOP
4/qRPyh9C2c8sFQCZ+67g+XM/fmAVAgN6g/Ja1noju2LBVIGplWgeO7g9E3lvroQ1ikbWG+q
tHAGRp6k2DuapNibFyhUIuguZeCVtzyc+TO7WLmtfHdA+9n53tyncrx1OGQeuC6HSMmtcezN
Jyn2HgyUZO5PqeSfGmtG+PPK2Tg0neq6C/EUw1yzj12u0VbElpHlu3Cfb0y7vi1H7VqpNJrq
wPPI+LSbFJtStd8dz48/nt7+tDiiiHxZtcUY69vsKFo5D5yX6KphJTVmQzsp2tlxlPQwvs9K
ChOezmF6O+wiwmY988bjWCxIgv/PP//0wctZ6l++HT9OT9fGxUzJ/WPUC2atIJRsOiN+IxaD
hQPHXLj+xYv30/n55+nt93m0eoOP/vrWdy5rek5Rxmgqg354WOVbQ18U6OGZC8EXcqNcmSff
Xp8fP0bi+eX58e11tDg+/vXr5djLoS1MIfELlobd4lo6Ajevk/5+OT9///36KI9CsxwrtIws
MY8AhqzyQQs1T4GSILw5oYVdYELfKVKOeeiK6ZTQluX96L55wCxI1LbvlbVOGJHtCTnQTtNg
TKyDkhAF07mT7syWYfmYunDHdT9luf5CURiMPfohCE9d0oTfoVBPaSnmGfwCE7aOFjYvEQ1M
OR1LOMnookGSxEhD6/tdOLYXXHPQbh3ZokYOyL2HIhScmV8jKdiBE/vAiFF7xPjor2H2cGBp
TkY7A+cuTgvq/CWAfV+m4hzA6e8n8RnhvSObMKydyZTQQhvCfE5ZA68En8gS1RIISaIl+BMr
wQ/G1jr6AWGjbnHCNnHFifPuEK9mnu32OFu6ziI1d7D4ATfBqKMUcda0olteYO5Tyn0RKbB8
bEgQVMspjFG6ccuIeVQOQYlXgt7FU4Tp2FY+3t/bUNYJbFpNCSOFxO98QkSXaDatZoSmhbiI
mX1dEnwyn9UDnHRKqAASvdv7MIjouQw1VbOUtKin49vjM/SbQbuwoHvBqDPhAK4w2bDnTetD
JUD4o6fJpPACywhMCn/u040Mj0lSSx8Mk5RIrl0VYuaMp0RSKgCnYyKto3yuJFjmHkUgzFMt
wXXowY2vBi9vWYgbxpSwCnSeYmlAJPiET09LCBz7Yt6SbIsmkGBFIfTMapdMxp6lRwIBo8zt
XXaXOO7cs3OS1JtaZo2KeVOfSHEt8dSyqG5r3yLThCV/yLPQ2pIXjq0hd6k/sSzNAHuOXTZp
KAMP8abjoVKCwGxPKePVJunn4b6itpkRY4HkprjJxX/1fvz1A9UPg8tAuDLFvm1XmAy4E0jb
XJBnz6+KjcDj1K4qqMGzOWTF6FP4++n5bcTeistBN5/RD+f785+/3+VZzd2KQCF46kbjRHpT
3vL9+PM0+vb7+3f04Lk9v2xpXrHQn0N6Yh1ARzA1UMuENxS4a2k2fOQbQ0LVNY9ufULhouZ+
wEHBCKsqLvewNpRxtiLiAoFYhman9M2amxJrYNFN+tJWzfx1ekQ/crzBoPXhHeEEAxyoKoDe
V27M41iiRUHE80t0U1KpCmQzxMkdcVYBwmwdl6U5BlTBHH5ZcDkGaNiSWhpxaPxVnpVUxnCk
xKk4LM2+ehJOYkpVlfDDXUzXfhWnC04IjRJfEt6RCELBMiKJJuzpt9qFCZX0Wz54X8rgY5KA
Ued06VTKA8SqHc/WRMieeq1McBgvlocnTLoD0Xic5VvzyiPhfMWtoyENV5zREWWKsqcPX5YE
Gd6d/39j19bbuI6k/4pxnmaB7XMS576LfqAk2mJHt4hSbOdFSCfudDBJHNgJZvvfbxUpyaTE
ogOcmY5ZnyiKLBbJYl1mbrGjEDk6j3q4Q4Xu9Q9xRoRTRhrGESW8AARu9zLU2Ca5h/0KXrFk
RdjmKQA6KxD5VBQ9YRjvNRMhPQWLUqBjJ0WWTPg+ow2IQ9PR0IbMCaYQFecJelZQGSIRU2cY
s4Ckl5SJH04l9Bdk0iOkVNqaH/nK+4pKeDgaprKkDIoUPS5rOKIoK1kSVONK1BTSvd9DxFJk
Kd2IO17m3k9A12Ay0L3qCHXR0MSEYbJabBKHdSQeXO1Veb+IyqCJKStAxcHjBb6rLthAaW9d
6lhYlc8/kesVaSMRsnffcLdWOXw4V32sLscEJYHAmG6w5qH9ojQcUVwIDKviQCSiqhLegmx6
u1eyC/WtrF2mvE9jJps4jCyKDdNehVavsCyDfVXIMatUG25mPKSYsHb9grryzedOjUjrE77f
cmFdbTI/kFSlFLIavipaZQy1tKnIciL3m+qUyi1AWlqziEEGJYIwD+5QQaJ2nbIaMrDFEdmw
jQvVwwGbufkQXXj8Vuzq+fOL5dFRQ+W2QsgSR34AMMi8JdvDp0pLvFWDb2qqykGtKhxICfs4
17OD8V+iwx1OyTBy2H0PH9aOnI5GKuddOwO6TfZ5lqjxWtbT46O48PaYkMXx8fnyIObkfOrF
zIA74G1eDFpdoQqcHqDcOUC53SOw2x52yhCRuLwYHEDqPeMJnfu63cDV+y+wnpfJ5fHoyy1E
ecnOz8+uLrwgbAHa8GNi0bHUxcnUXu+GL/c7p1uMkk4hzTXKsZJYQdVUJrIhIK2yNc/ayjyv
+P9MVBfA8R8tRB/X7+u3x91k86YzZv78/JgYCUVf7/90Tn73L7vN5Od68rZeP64f/3eCdvtm
TfH65X3ya7OdvG62mFPr18aWnC1uNBa62BOJxUS1IUUO4iJWsRlzr+omDsMQU6cpEydkNCW0
OiYM/ma0zO5QMopKwqRmCCMUVibsR50WMiYSpZtAlrA6cm8KTViecfoIYAKvWUlEQDJR7YEY
k6CEh8eDZ9CJwfnUE5SoZu79mHi9f8JQLo6k80reRSF1ZabIeHrycJYoaK2Yel4JhIhw3VZb
gwVxmdgS6TBL6DAiIk73Na4JF7bJc98tg3wSdq8r927nY/Z2iHiep4K4Bm6phPeHEntRXREa
IN20W0mE51PyWeRnntFM+DyvyBO7Qnjkesey4eoiJO6xNUxZINGjEtEnerVKV5FoOJUXRfUR
qsEiGN2EuQ/tqqeEhH9u5zR7EDfJapEoMer8rQhKUh+sPiVfsBL6nEaQvmx6myRV4hhYKmdi
iQlFPayMWtQZoaAEwAqeptmG36meJTIxqDlaq7hk07PjJS2OYgl7ePjj5IywFDRBp+eEHa/q
e5FdNzB8vPR3URizXA40d/1kLH7/2T0/3L9Mkvs/bqdhtVmgovrlhd6Ph1y4bU/6feWRKwgv
UucsmvPRaUeXHli6TRAMf2KfvcbAWwzRiZqB71MHtVsosjptgno2w4h5U6On1tvn99/rLfTV
/gwz7Cj0YUUWoGcmDr1HvHT765q4OlXtLb3kboNJb/2WjEpdp9abW2/1SD6hp73MCnxc7Z/p
OrCBdCcFUehtAkujs7OTcx8EdhrT6QX9CkUnPBlUH+fX7utlJQrm0yP641p28rgCq2UZU2h5
jkiJCDDmRi7huP791Tp66BxMduGs4WE6LJJ1ANJxWFpmIPeh0BYS6k8iZTsCUCNGnW+r2H4H
FLRvGR5qgcCJoCqq65rMc2TRHetp46zOQtT0eyApk7I/V9DNGG9fBoBDx6cw0jFT1Ph56oEj
WpPSzZ1rxbmHTikENTUK7MvRvTTb/EfdQr6gvP+jPKmrP+/rbyG1BNRJIchIPfWCsLYhTJRS
ntIR7FCVBnsT95tYGHI0JIXJRST6E/D/mQhY5ppZPGIhnBdyVKTJsKwNDZ8ijVSGZRU2Vjxm
LAgT4CK7KA6rXK7chV0c6r+2Hw9Hf5kAzLiUx6H9VFs4eKr/PoRQ8SOQlrUh3tQAlhjh1YyW
aACBgWfaiNx+vyovyjx0FOtwP47SphZcJRGy8gNgU8vb0fakVx1j8xz81j3HguDsjhNK/D1o
eXnkUr11gEjC7uPCbva+fOxuP6CHPINtJRF22IASHiYG5JxYjzpIvEovqdhEHQZt4ansBB2m
lGfhyYF3CZkcTwkrNxtDmEB3oCVA3JqEDqF8zab+z1IYyrLXAn0FQ9j29X14elwRS38HCW5O
iHRaHUKenJ1cEW7bHWaWnlBO2f1YAfMSQQEMyNml23rKrIUwR+0gPD05mrr3hH0tt5eX9qGk
j0tyYKJijxL2thbk4BQ5ITysLIj/QxFCGBZaEH9fIISw4rOm4rFbDdF36dUFYce5H7rTw6N7
fnyIR3DKn/qnsxYd/v6F6TM9PjBX07AY+GCZ6wEGQcuiNuhRzz+4v/iCwI/kyZRIT2m38BAj
Ax9d2Wov7cnzcv/xa7N9PdSOMM3d2w+DPaaEFagBOSO8S0zI2UFWPb88a2YsFcnBNeiCcKvf
Q6anhEKhF2vV9fFFxQ5w0ulldeDrEUKE4TMhZ25ddQ+R6fn0wEcFN6eUR3TPD8VZeGAaIsf4
p5iO3TRiqc3bt7CoDzGUL0d3v1pU8NehxUBmRNCh/lsvBqqW3s5Prt92my3V0ihl1P01kIJ6
Zlxa9w/JVRYqxYt7r14vvRpGKsOjKPuUBaO23D5voRWuD8DHRE46DrTkdGDG217QP2w3u82v
j0kMZ6Dtt9vJ0+d69+GyaohXBccdrQwLMgpKxeZU4ux4AdIwc4a2ClVILLn53BKZXZSjWCGI
uF6xDloKousAIK1qwou5Q1SEZT1vA6PCFxL2w0wkQe6M/pmnaW2crqxM94o4Ke6f1h8qupe0
Q4CW69fNx/p9u3lwzjCe5hXH48qoR8v3193TMOG1BOC/pI48mb9NQowpOdmh0ekvaEpkg9nr
y+YJiuUmHNYTbDf3jw+b1wGtb9dNLcLQEWpPYZ7/TpeuSm8+71+gTrJSWWcYw4+KPgvf1hBD
U6R4SpuV/MY9tEvMh06d1XPi+COIGZxVbnUAnExJFUKxcF21i/KmzRDZzYIybeZoBcOWTVZ+
PzYag4kJyepVNLZDKdtnjnttVH3Lz586CqkVNk6LdF82pOYaTfpRH0yiMGwdhgadXmapUvsf
RpH6ZWVISrp2EVekpePOk709bjfPj5b0yaIyJ1RNEXNN+WwYal5WRBBQlSSJsCmfFfOxi/BM
Cpdsnsmxe/XsGQSKHjwzif2ymjYzSz3ZFjVLVlVu7gDESTNzXTEA5XRcHRah27NYNix06xI7
lORhXVIKLQXiWViuCtKMWWEordCPIJqabcPfJBhakwYhC2PLnKLkQvISaIRq9QdNWtKk+UxO
KVoeeohB5WlLJhLPo7Mp/SRQIsJ8lxrKvv9xYRuygC5rAlzvm7xwsQ5unhqkCxVztV9Iswhv
TVdDutkeN0v09CyvxGy1rzMaFghdAPKEW6m3Z0wTnP1wU+eVW+mhKGHlZnQM+T2Tp2THQxtI
RoB9IGwhG0esi/D+4ffAh0Yq1h0jo29lnv4T3UZKIuwFwl4Kyfzq/PyIakUdzVwtiHL5z4xV
/2QVVW8qAUPVegvPkmxcjRhVL0i79efjZvLLel23AsA2qDH1uarg2k6GoMrQjbNKBoW4pUWz
TgGsZ3KEIsI6nEQldzHbNS8z860DpXKVFvbMUAUHRKPG0NI4rue8SoJmuA1vyfof1YP7uylM
Z6PviVey4qnVprxk2ZzTsoFFHtqMpnE1SSlqTD8IJJVbkBKBnrYGnuaMSL0E10JzP2xdiV4q
vh+NyhewZHF9U24tLz0daA3MXkqWaKCs05QRG8y+KpoPNASv2tCwBoRhl12G/MY7fZ8zqCG5
c11valqJx57xI2UdEM5gIezQiQGQNzWTMSUPPItlKjKYLpSQTD2MVNC0m2x56qWe09TS99IC
71iJ8/FK3pJilmLPLsyzPXs7op7n1u/b6eD3iTmAuoRYzBXxdAiXC2JnreGNy75FWZtntvBD
OC53bTKpyMmpHQglK2yOo2xYhetyc66SRBWYucSwrMbNw/Cn/jzjXUOvCDholkU4/N3MpZ20
SZfSRjohL2JqqENBLXxhQT6TR4wWwhTrJCZrJLJztPj+1/Nuc3l5dvXt2LheRQC8hqu18PTE
rWi2QBdfAhGBOS3QJWGbOgC5T38D0Jde94WGXxLxbgcgt3Z1APpKw4n7vQHIrcQegL7SBedu
NfYA5NZSW6Crky/UdPWVAb4ibkBs0OkX2nRJ3EkjCPa7yPuNW9NvVXNM2UwPUTQTMBkSaW/N
ttDPdwi6ZzoEzT4d4nCf0IzTIeix7hD01OoQ9AD2/XH4Y4iY/BaE/pzrXFw27n1VT3brgpGc
MswCkxJWxh0i5Ekl3GqtPSSreF0SysQOVOasEodetipFkhx43Zzxg5CSEwb7HUKEaF9NpHjs
MFlNqOut7jv0UVVdXgvCPRsxdTVzz+IocWvcYNsKO25twzZ21Uuef27vt38m283nx/ObaTUU
iKrkeC1jbYZVwk7lQrmnu3Ynrb5UViWs8HCeh2/vdA8OSMIzgooZretKmKt6r4sNBV41sGJM
snOJhhiKJBSVKxAn0I7Ph+Dq+CgishwhWVR1Q9R1Mh3UdQJnHp7MhkZRNgAYlAerS8ejmuKe
9i2ElQsqDIhGBARbApWs2C3Q0EwVq3RPJyC5OZPVkag00+jMcv4bUhVQxd9veKpD278Evnw/
+qoU9nt2KZz1oLA7M5rlp87y5R0WD383y8vzUZnSwRdjrGDnp6NCVqausiqu02BEwOzJ43qD
8Iflk6pLiT7af1szvzNvVQxCAISpk5LcpcxJWN4R+JwoN3qCSZmHAgS7kiElM/ST6JCtcjAO
i1RyMmuSY3mkWreXfSlrsjwvhnpXC6Cumt2K2ejG0I7Nk9xSGeBvHzNmCeorxkJIW56anBAm
d5is2ZrneRkREyGK3Iu1KG9U/m1HU9JCWPar8GMWGQauOYZ84HMBMtdKlSzhvyIRrq+TeNWU
G93T+89LTEHEhHmQBFGjh2pfcwXrztzZfWr9uV5v39Yvk9/3D5g/vbsafd8+v338WxkSPb6u
d08ucwSdLFRdUrtVgpj4FUOmJLBKJf058KLvK2BP3MqOEKetFnnz+v78sv6GUXYnD7/XD//e
qQY96PKtq03aOQUTajqapMM7NwtWZkZ+ZMMmWdPTWlYYXCg0Et7PSpbqJ78fH01P7e4tYF6l
jVwRluUlZ5GqmBGZaeoMk6hjBUGeEAoe5dC5yIir1NYnxzWzYng77BH6Dxo8I7my4UdlbYoB
i10MOIDoDsyzZDWuTiXGbBacXaNmpEFbHad2DcPkoGqqvHEKTqxKK2M664V0/bqBXVK0/vn5
9KQZ1e4clQ5aUjd2ukoEsiTJiWtfrKbIYSOfUQYlupo8+AFdQigckzroYEQ2AkRg5DDnaOHu
rv1+kMUJdOS4kzuKp4lQf3gNOzrKakajiDyRmqgtEWAuOaWS0VD1Lrw3miX5wsFhJtnX5FjY
3KCvfHDAJ8nm4d+f73r6x/dvT6MA66hnqwuoqYKRsb0b+5cgqYlrEIYVk9fmYqkjgfSkpg3X
/f14emRs4/O8gk0BSw1gAceJ0PEyEtvcsqTm341qFzf+SOv6MVS0u1dOi95X33UNxtZobxTM
NUEVD6WkTR5x6OBpzWE8i7Rk8Qws9uY158VgUunTD1ph9ZN68q/d+/Obyhn435PXz4/1/63h
j/XHw99///1fYzGP+5K64ksi/FLLVg4LsCGnH6xksdAgmLz5AvbP7tOhxqrrZ4+UKWEudHfM
7k0+VoDd73lJ51STQL8eaAuu/gzzTLY7APd3qpfCzEGfXtrBdd8Pju2EsSYCa1SoHndXgssH
dBCsexh6CnhpHMJxKPG0yCXXCvjfLYZRto/KbR9Q0XfaNUEcQkjfWqAu7wUnQgS1eSJL+Mqs
Esxe3LXVXFgTi5riEyS7Kj44UvAgrsAzP+JL1dAjiVR+Iz1XEu30uWk3BiW9JWgHUvEhrOVo
P0coc9oeb3hZ5iVIsR96f+IEa8nux+BpNQtXg6CG5jrXeTrqrijNk5BJnZesiN2YLpzUTFGH
FajCJg3zOqtgu4hHkgEEDQhwyigk7FGyyrzxh0K1xx+60/Vv2/eH/SXU8QaW1JkPopcADyBe
QK/6AO1eu1t7NZIwV9Hd03YBEWdaPd/IjI1CqHRLMgZIiHFaKSOfLM+sjunKMcQYRnWN2geI
ZaGHw5h4gXqZ9HREF6NH5J6JBq8LYIt7C1KECpInsRPFfE714p5zmgDYPU5ZObaKLj/f1Gmr
Wu8+BvJIBX1QMcokFRFXQUhq0C0KavHwiJygKrlHJClPYNjnNH4YCD8QNTS9Uw74lzL1STFf
RnXqXmf1N+szdsyTgux+xF0DsMqJYOgIGOuIbbo+3tP0uiaMRhW1jJmMK5x3nm+lIpOiAoe5
kqkPOOTavY7r5kk8E+aF2/xEf2Hh+XxtRuWpP+KU+wOcZvyDjBsuENDXfEVY+agTnYpHhTqj
sqbNQ/VYpzmRf4ulhTt2xl61fz2PLCUV/nY80GuC6kCyDGqGs5q4U1LJfFrBFgxkRwvM8iar
E8LhHhG+d4Gwgs5shFSb3IWpQMF5EFYtwmwBCDeL5p6xaNwgpNbRqMXdddwBkCaa1nQo1bSk
jXhRxd/PDQ0NXpnCKQmOWJQezFxpMK4NHCS9sFSKdib6cUsqIWEQwXZ8ISoiNheeHpfARUtC
skEXcFYmq/Fc1D4X64fP7fPHn3HcS2Rua9HTsS9hVUESyjDCjE3bvvKInh5AaKK4yaFKNjII
2/N+a3kN0oRL5SaguMKL9RLdKi+cRzErYdMNTUahgzJHn8nYwNhyBHMzBixqaLwr87okluhW
fmA1GEVQrwXOA4ve8ey7goVjXURH/f5XH8FADUHe6cPC7Z/3j83kAUP0bbaT3+uXdxUfxwLD
J8+Zcg11FU/H5ZxFe/tNo3AMhW1LKAorMMqQMn4IFxdn4RhaZvNRzVDmBPaK41HTyZZ0lBHh
uigcaLxNcbxaWncgbWnkntQtlYeRS8faUlOWsbmjVW351PE6ZLiDFfZyVSkAHLXMZ8fTy7R2
XWm0CFwwRh2MheN+QdPBm5rX3PEi9Y97YeyafBjC6ioGmeSDOO862OfH7zXscB/uP9aPE/72
gJMI89795/nj94TtdpuHZ0WK7j/uzc1v13giXE7XiX5yGDP4b3pU5MmK9KtvsZLfCFeqwJ6L
8N5H3MKAaPc45c34unm07fO7FwfergoJW9+eTFgHdk1xezq15KRc0J9RQMvM0Eht8dL/Rlhq
FiUb+wbH97vfdB+kzKWo7WQQUF0NOdBzt4NKtcb6+QlOTyNRrO/tnTMiJEzQ9gCvPYTmPXLj
3vX1F7gujSh7hJZ84Okz3Jt4IQIYlycNla2vE6xpdExkRTYQhKnkHjE9cxuO7REnhBd6Nwtj
5jaSM+jDTx4hoBUO1gLC2bF32AHhNkjrJNy8pHJjd3K4GLxCzwsVV2833itw18IApZSTa4fI
6kB4Jyyj7VzaHUO+mFEmV90kYClPEiIVQo+RlZdDEeBliYjQ4rTkmfrXK5tidse8a5dkiWR+
tusWCv8CQSRt6OllAft6/xLp7c1qkQ8Hpb+W3653u0E6pr4HlfWPd0m4c187teRLIgJF/7SX
l4AcO3zT798eN6+T7PP153qrPeFH+aR6dobTXViUmctds/vIMkCNQlaPNkSKolYTx8ZQ0QZi
egwZ1flDYDYojr7UxcohSpRWBVUzh5aAHijb3e+XwCVxTTXE4TnBs8JC29SN43j/v3D1Fb9t
YjHLmosrInmgAcQwoCEjvPQduH6olTqLyN1oPFexRFS566TJ5CpNOZ5h1QG4WhWGbt8gFnWQ
tBhZBzZseXZ01YQcD5gCDVKagpWWJWZxHcqL3lqmp2reXW8/MJQC7Fp3Kmb77vnp7f7jc9ta
zGglbndEVZ48TYUZXfRZvrT8YMd0iefP/RFX0/myKpnZYuqEnmcRGr4O3udG66r3iTB8YLQj
q2FM7kaJpv4fee8Ngq4rAQA=

--EVF5PPMfhYS0aIcm--
