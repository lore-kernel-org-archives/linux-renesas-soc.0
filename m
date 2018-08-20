Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbeHTWaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 18:30:14 -0400
Date: Mon, 20 Aug 2018 21:13:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/7] mmc: renesas_sdhi: merge clk_{start,stop}
 functions to set_clock
Message-ID: <20180820191322.d57qoylkenpm2qhd@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
 <1534403799-10594-6-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ovoi5rmutmduozyi"
Content-Disposition: inline
In-Reply-To: <1534403799-10594-6-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ovoi5rmutmduozyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 04:16:37PM +0900, Masahiro Yamada wrote:
> renesas_sdhi_clk_start() and renesas_sdhi_clk_stop() are now only
> called from renesas_sdhi_set_clock().  Merge them.

I can see the benefit of this change...

>  static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>  				   unsigned int new_clock)
>  {
>  	u32 clk =3D 0, clock;
> =20
> -	if (new_clock =3D=3D 0) {
> -		renesas_sdhi_clk_stop(host);
> -		return;
> -	}
> +	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
> +		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> +
> +	if (new_clock =3D=3D 0)
> +		goto out;

=2E.. yet there is a slight change in that we disable the clock a tad
earlier now. I need to check the datasheets tomorrow what is exactly
documented and report back.


--ovoi5rmutmduozyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7EtIACgkQFA3kzBSg
Kbbwxg/9EAwOxzkpKMG1NSGkdJI11fIqowddtLRrZRn56U1/ppAZeV0QCyJ2xHnj
Au27VG6YSZFNLwE0oUoBuhP1DCaWBteiIw5HVguZp7pkzeCbrBFvai9di913PseK
KUXOPdMuv8tOuw3f85tr8zFoKCIfhw0sByCqYfPbkGukcZdVEmyIKkGMPRvXoKHf
K/+t7zHejSbj7hVlIuGcVw3zibZMx0DZD8WMgzF23xfTmPk8XM0c8jpbmc7tX1a8
mwdTzz55OPYgetFYbBOr6a+mjuZtgfgMP9YKud75ufPGhu3VClXsTeyJ7gbUDZDA
GMyJnfLrceITJLgZ3Nzv+uEbkKD+DrYlKeiUkjZcmoZywQkVy2UgHn4HohythaJo
js1xJkxQqwAAPfgUm5QKEoC6NGXieHz7qtKeEni2qGAZAJZJbbwWDO2qW1UflixE
RjRNi8YN/gPVZ70QTYYRH6BPdwAgmxSx4q/SNmJVJNFdanl58x2TK4An3BrBSD7X
HLxZ86wyxfDcY2yWYwErehjBV4F7vR+CAyxvZaC+uWse4lhvBjBoMVKwJ8ruRB9M
EXrd5+M8BX4vroZszLqxxrXnB4YJjNPl1SXsAx48QIUlMzw/Hv82iW+KAQoLyKW1
tQ1YYC1PP40ubm1qcY5dKvMvBSsYn+cbzKQw5uHSX0btUAIlmX0=
=9jYi
-----END PGP SIGNATURE-----

--ovoi5rmutmduozyi--
