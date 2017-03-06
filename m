Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] phy: core: fix the condition to enable pm_runtime in
 phy_create()
Date: Mon, 6 Mar 2017 05:46:52 +0000
Message-ID: <PS1PR06MB1641B6B63E4317B7C593675CD82C0@PS1PR06MB1641.apcprd06.prod.outlook.com>
References: <1488540814-21232-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1488540814-21232-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Yoshihiro Shimoda
> Sent: Friday, March 03, 2017 8:33 PM
>=20
> This patch fixes an issue that phy_create() never enables the pm_runtime.
> And then, we can remove calling the pm_runtime_{en,dis}able from some
> phy drivers.
>=20
> Fixes: ff764963479a ("drivers: phy: add generic PHY framework")
> Cc: stable@vger.kernel.org # v3.13+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I would like to recall this patch because I completely misunderstand this c=
ondition.
I apologize for that.

Best regards,
Yoshihiro Shimoda
