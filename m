Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55580 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbeLIVv4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Dec 2018 16:51:56 -0500
Date: Sun, 9 Dec 2018 22:51:54 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RESEND] ARM: dma-mapping: update comment about handling
 dma_ops when detaching from IOMMU
Message-ID: <20181209215154.GB5856@kunai>
References: <20181015105517.28032-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <20181015105517.28032-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 12:55:17PM +0200, Wolfram Sang wrote:
> Update the comment because we don't set the pointer to NULL anymore.
> Also use the correct pointer name 'dma_ops' instead of 'dma_map_ops'.
>=20
> Fixes: 1874619a7df4 ("ARM: dma-mapping: Set proper DMA ops in arm_iommu_d=
etach_device()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Russell, is this patch in your realm? If not, whom should I contact?

Thanks!

> ---
>  arch/arm/mm/dma-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 66566472c153..e3b04786838f 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2287,7 +2287,7 @@ EXPORT_SYMBOL_GPL(arm_iommu_attach_device);
>   * @dev: valid struct device pointer
>   *
>   * Detaches the provided device from a previously attached map.
> - * This voids the dma operations (dma_map_ops pointer)
> + * This overwrites the dma_ops pointer with appropriate non-IOMMU ops.
>   */
>  void arm_iommu_detach_device(struct device *dev)
>  {
> --=20
> 2.11.0
>=20

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwNjnkACgkQFA3kzBSg
Kba8Jg//RVZXpcefzwMK10YSzI6pXVYr6rrCsxnlj54ke0ZxWKEwjFOGS/EExTyZ
diClGz6hZGfbHw6sNYCWZVNM0gaGrYfOrAgjHSVIC5utBjp23t5cpJZ+qxphh4g/
9fYtBIXSamxWugLhvv7yBL5Z/ucP+TVINxwzkSwuplih5CWEnhM/J/8PVHqL1uxT
YJ/5AUoSh/nn651e0os9QLOzPmkS6S8wYpeKaPYmViJjo63mwtlOf70+k39rzN+Y
q3k/r2n4YweB9Xw0LH39C9yKvhHipGI/7NGUg0ZjIgSY1UR6T+fZriZ7okRUvxLj
wcCiqWHMd4GcSuryUaWFDnMKz/BIgSQCkvBVyxWBQBYj5rJO9Rw/Ej++j7guA5Dz
y4UELULL49kz6ofR/iWwnmr/KcF+k30iryzSwhJxKuY8GkhBZA+Cx3Y75aCyKOWJ
205j8fjGHUq3ufPG9UBg4YHB+vXMo0g2fNqZwzU2VaAX1IC2Y9MoQ6na2QrIKnp4
XcIRF/ip03W5G0h2cJXQDV6Y4n5HGbjCDcrMhXmvnDHW4CSwv3YoQaduAPmcsN9x
G5IASEOczFuhfddvwJvB1azo6dhAMfIG7TlTWnZHDdh3+7Fy3EFVbXD5nmVM7ha7
CB5eR6CTVzXC0NjaT32fbN1G6f6SNoy8mYVNCghaKGfkgfvQYMU=
=nRSh
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
