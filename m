Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47596 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751259AbeFISP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jun 2018 14:15:57 -0400
Date: Sat, 9 Jun 2018 20:15:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180609181552.ks4awvnin4khowb4@ninjato>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n3ombptpmx5tx6bq"
Content-Disposition: inline
In-Reply-To: <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--n3ombptpmx5tx6bq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Jun 07, 2018 at 01:22:50AM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> The initial value of the interrupt mask register may be different from
> the H/W manual at the startup of the kernel by setting of initial program.

s/initial program/bootloader/ ?

> Since the error interrupts may be unmasked, the driver sets initial value.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/mmc/host/tmio_mmc.h      | 1 +
>  drivers/mmc/host/tmio_mmc_core.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index e7d651352dc90fb8..bfb76b2963f80894 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -102,6 +102,7 @@
> =20
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
> +#define TMIO_MASK_INIT          0x8b7f031d /* H/W initial value */

known on R-Car 2+ only!

>  #define TMIO_MASK_ALL           0x837f031d
>  #define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
>  #define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 3080299303045adc..2ede81476daf76ce 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1273,6 +1273,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  	tmio_mmc_clk_stop(_host);
>  	tmio_mmc_reset(_host);
> =20
> +	sd_ctrl_write32_as_16_and_16(_host, CTL_IRQ_MASK, TMIO_MASK_INIT);

So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd think.
Maybe we should even move it to renesas_sdhi_core.c, but I am not too
sure about that.

Regards,

   Wolfram


--n3ombptpmx5tx6bq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlscGVMACgkQFA3kzBSg
KbZmHQ//Y2Oa8gxRioMHmcw7PcGya0zTDBVZs7UQFe+Q2OPd82XJUTDNh21vqm8j
yHo7/O20c0jx04xQdPxeueIzrFYkUWUnQLVT6sgmvZjl1i6hPn6wlnY0bJw9S5b6
Xe9owLlDCRbn8CRHgyRGMyou8vjpHvoWteFCZIwSto66ug4Po7ykqwaI30R8REpp
dRr0XSd5iPLQ4LeS+GaGwJs8ZOi4pXlgybEoDFXc+kntfy5vLLXhYAglieVRVWrQ
2PP+iAgWvE0xzaf4EeB/ua6BwijJiMgAc5FAF/iJsVoSK4YGqJra4Gnwjyzc/hpt
6Gx4ggnWCYe8PiRzr8u638WSVhRMW9Omma4i1AuL8qnZb4O6WWpnpOxwuBWXtizf
amFtrIcxvNsqxnJXiF1pdw6S3tgwcriCrVZ50WX7AhGc2fPmFsGYRKO4GVhg+3FE
TMkN6Vqp4Cr7TNyIuf+ZAe+yhqy2/ClnEExkWwAW4LlXhaiuXJXqaZWezYUTZwAT
ZJjXBmL71LLbPTmB09JslimqURvebpptYzoRzyc7QsvBBmodR0dj67KpM2RKV+kA
Kpfxy9wr2znGprYCiYRr4pG43nNSiyRQWNCpuGsBqV0Rq80dSmX2rWjD4qnW2ho0
iA06MoH56MoXQT5OI1S2ZuHTCkUp/F/aH6Y5wESxcS1TO+pS0Lk=
=ad7k
-----END PGP SIGNATURE-----

--n3ombptpmx5tx6bq--
