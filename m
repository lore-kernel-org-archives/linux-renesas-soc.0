Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:51486 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752236AbdAZORA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 09:17:00 -0500
Date: Thu, 26 Jan 2017 15:16:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126141656.GD2718@katana>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <20170126140643.GA11104@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I have tested with "the new mmc/next" and things seem better.

Good. The issue you saw is expected when you have not the enablement
patches in place.

> I am still of a mind to drop the M3-W patch of this series because unless
> we can control the order that things are merged into Linus's tree
> there will be a temporary regression there. Moreover I'm not very excited
> about renesas-next having regressed.

I have not heard of a regression. Geert, did you report that? Did I miss
that? As you can see, I did test the patches with M3 as well:

http://elinux.org/Tests:eMMC-HS

and Jinso test team (Duc-san) confirmed it works for them with H3 and
M3-W. In private communication, though.

Regards,

   Wolfram


--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYigTYAAoJEBQN5MwUoCm2g0kP/jLngv/JmaAohGJHbUPBWbDS
r+B3K84op1DnBEz0EeIVPaSb4NJhzarm1c1Abpvso97TkyhKYbKkJCQtIJlEHI9I
2KSLLim+VkYT5K8Ist5SIr6/yILmijki7okYn1gWpj9db7CWtyDAmJcPswMMciLl
kL6KYR2jVM35Bh+Ob3PR60JDh6YIVc3Q0p1ZoFlVHuGckyM5/1YTREtRWb9MS3rX
q02fKEmoQ1a0mohQCytJ1RW2i/3J23EZQj2VWnF2w+K7V9XTipQpOO0xaIMM+uCM
t1Aof76YnGKmKPWS2FDNrJ0sno6cJeEW7y48Ep6Y8IUvvOsPYwAZTy6PhlHgbpPJ
Zp7dhsBRZAuWmGMTIBN0wo8P35bO2+qm6BM4Tsc8Pu5iR1oSQxG8SFJQFADGFbh9
pBY/6ngl38xQc4gbyw1ba1zXgRLS2GBiaemZcYOKUJxSV8E5GVjiMTOx3/fcYKTP
/bpBxCTkWu3p1JGfpPM9ifCZsrTtN7gtTUXe2LdBsistKaOzPS3SoTi2Rj2jJyU6
f93NTbsiD0rbbcxZfSv6GY34CcSPr3a7EJB8ssa0iRGb1kr3cJEHyWBYpAP25IyF
/FrFC8ysN42GzgAdhpgO542OgCxP2GlwFCxWCMYJQyRt5tG0Mr8CratPj2ITKfRn
brd89sFYocudbBM2wCEe
=CTRs
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
