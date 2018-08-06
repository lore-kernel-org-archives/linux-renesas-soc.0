Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44948 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728071AbeHFTOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 15:14:37 -0400
Date: Mon, 6 Aug 2018 19:04:32 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
Message-ID: <20180806170432.26uxlzaqvhtjcp6w@ninjato>
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com>
 <20180806145958.k7bt6buvekfbyxnw@ninjato>
 <CAMuHMdX5QcZOzGArJaZPoX1DMLMgCK97-2pZM2MCEL+Vs5SWPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sedw42wtvu5m3goi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5QcZOzGArJaZPoX1DMLMgCK97-2pZM2MCEL+Vs5SWPg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sedw42wtvu5m3goi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> Please try without that step, or do "echo none > /sys/power/pm_test".

Did this now with a q'n'd hacked gpio driver (see below). Worked like a
charm. So, the sata_rcar patch under discussion here seems to be fine.
We only need the GPIO resume on specific boards. This is a seperate
task. D'accord?

Thanks,

   Wolfram

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 023a32cfac42..17ab27ca0187 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -914,6 +914,7 @@ static int pca953x_probe(struct i2c_client *client,
 			dev_warn(&client->dev, "setup failed, %d\n", ret);
 	}
=20
+	dev_set_drvdata(&client->dev, chip);
 	i2c_set_clientdata(client, chip);
 	return 0;
=20
@@ -986,11 +987,27 @@ static const struct of_device_id pca953x_dt_ids[] =3D=
 {
=20
 MODULE_DEVICE_TABLE(of, pca953x_dt_ids);
=20
+static int pca953x_resume(struct device *dev)
+{
+	struct pca953x_chip *chip =3D dev_get_drvdata(dev);
+
+	pca953x_write_regs(chip, chip->regs->output, chip->reg_output);
+
+	pca953x_write_regs(chip, chip->regs->direction,
+				chip->reg_direction);
+	return 0;
+}
+
+static const struct dev_pm_ops pca953x_dev_pm_ops =3D {
+	.resume =3D pca953x_resume,
+};
+
 static struct i2c_driver pca953x_driver =3D {
 	.driver =3D {
 		.name	=3D "pca953x",
 		.of_match_table =3D pca953x_dt_ids,
 		.acpi_match_table =3D ACPI_PTR(pca953x_acpi_ids),
+		.pm	=3D &pca953x_dev_pm_ops,
 	},
 	.probe		=3D pca953x_probe,
 	.remove		=3D pca953x_remove,


--sedw42wtvu5m3goi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltof5wACgkQFA3kzBSg
Kbavwg//Uk2p+YBKFAGUctTBxcZXCkuK6wG6D3YKoX5vu2lDmlT2IZYZcdtZYvSn
qhRhPxcFdCzmvrXuU/2ksRKemi6YNbRwV+sOG2FJIBE3Fmh9UCDIKVwIZY4NNKkN
M3iW6u7FI4VCHLus54ci2OSoVkMAhBW6yQ3U3h7a2N6dNfSNKVYS1sq1M2UXc4EM
CyGXzaiS0GJt5jxhszd2mOsIMyqPVCXy0QHpAoFKRUhohb1EWgXGoJMQ6ElHKm3O
F/rU/rnv/tr61sPsfelR2XxNBWymBf0gILnAlV5SxjuUeEwnCG61UfsA3NQtmLHy
tjZ0riV+VlLxdChRNjzYzleeI/GitVPcKNCwk94iM1pV2/L1d9N/bx7Wm/sKMi2V
bQ4n2nAwBeGy5j568xiVDwJHifxOpsXxsbxizpMU+BC1BtnnAQqLFdPfR2O5fMEU
j72XC8YjKaHIx2orVNXOKfmYPO4K6PKim0LeM8KMGyy9/F8jPQOd6Vy0Bcj+1iy9
EOYmYECULHzQd635qYXZ2K+OYxoXxHke/XaSVmkTZmIn+lEfJTicJBI8dOpJi/AQ
IVtzLO8LVxuBEu8hOYa3H6kBEL6C5h+SXdH8+SJQHmrYg82c/TvdhblSJEzKbmIz
MqT6ZqVdCIay93+Dxv3opCvgWKieyn4tChkfsJEhIDgruG74I7U=
=RywJ
-----END PGP SIGNATURE-----

--sedw42wtvu5m3goi--
