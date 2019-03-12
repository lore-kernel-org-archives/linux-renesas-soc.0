Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE81C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 11:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1794E206DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 11:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG+C14t4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfCLLru (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:47:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38623 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfCLLru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 07:47:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id g12so2346749wrm.5;
        Tue, 12 Mar 2019 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9z07tzDF3bCk1Q/lo/grMZyq1CoBoKH5VpynyTJbiu4=;
        b=lG+C14t4WkeSCSqDNvnNW8zuJq8jLzcTzcpIi5WlaUCs8dy8e7iY5I/k0K7spvkNz0
         F6AGjdDYhqO/o/o2gZoe/fZjiphiIEf98devm3NgtwiYYpgfUPaUpGtujogBUt1zbabh
         TBf8dldR5G0ociyecpAo0EkaVO9bnh9QjxJamKM1Noi19PXFU0AuZMAr9MKu5J68PPxo
         6fAZiGv5c7tlW36wlNV3A67b6t4bjfEemrOYyDAaGdVC6j5dsnLBJNHDFg/4zHVERmma
         YvkiYwPbR0K/V1urBREoQ1ECZ2wjLgUjAB0GQwOQo/Z9j3l3sODQIANUBhyco7rJRCEg
         2s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9z07tzDF3bCk1Q/lo/grMZyq1CoBoKH5VpynyTJbiu4=;
        b=QC6+kom5p9WaPjRZNTpZR6vEfLxOmtqm1p2mO/EsPRqq1W2FHugeOdjVUx8qXisOuA
         6QAIjluYaSxq1gjdfuf0Dywf19wRhDQtFxnZja+qPIO2Daqt7FLMx6oFcrPkKFH+2Qm7
         Qpc48VBOw+KoMvmc0tq+mqgo1NUsvAO9X2LDIQZLWbJKxnLYTjeRtpRXiptn7SM3+0VF
         EJ58OwsHBWPN7XyrWwjp0Mgo8AMysijL9+oz7uwCU8fxBT+6hQNBw4Y18tvna3LL2muK
         SnSFAs0w4wovg+JKf2vrsRSj+30Lz3Ybf5vOttxhNosYuPT7xBnGgCkVic+jNkrZCfik
         W0SQ==
X-Gm-Message-State: APjAAAX+4kQwj530tX4VEX64M4J0MmvwuqO8PXQMIZU8okRH8RGsdIML
        sbh7HyYv8eth9uz4Ow9jQYw=
X-Google-Smtp-Source: APXvYqzj6jdtHNiv/Zqn2zjfbFaRWP4SdD0ZYwKQzFT6YCarlX//GHdDtOdVhi23cXrI5tvKCznK0w==
X-Received: by 2002:a5d:40c5:: with SMTP id b5mr24081047wrq.107.1552391268177;
        Tue, 12 Mar 2019 04:47:48 -0700 (PDT)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id 12sm4643304wme.25.2019.03.12.04.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2019 04:47:47 -0700 (PDT)
Date:   Tue, 12 Mar 2019 12:47:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Message-ID: <20190312114746.GK31026@ulmo>
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190312092302.2x6zf4imlfsevmkr@pengutronix.de>
 <CAMuHMdUYqk6nFAd2TQ_xM9q3bHskpd8vZXJ8DiF3tFwJQLc=tg@mail.gmail.com>
 <20190312095433.fl2nbbj3jsqxhcny@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Content-Disposition: inline
In-Reply-To: <20190312095433.fl2nbbj3jsqxhcny@pengutronix.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zPXeIxDajdrcF2en
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 10:54:33AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Mar 12, 2019 at 10:49:59AM +0100, Geert Uytterhoeven wrote:
> > Hi Uwe,
> >=20
> > On Tue, Mar 12, 2019 at 10:23 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
> > > > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > > > index 1581f6a..2fdd6611 100644
> > > > --- a/drivers/pwm/core.c
> > > > +++ b/drivers/pwm/core.c
> >=20
> > > > @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
> > > >
> > > >       free_pwms(chip);
> > > >
> > > > -     pwmchip_sysfs_unexport(chip);
> > > > -
> > > >  out:
> > > >       mutex_unlock(&pwm_lock);
> > > > +
> > > > +     if (!ret)
> > > > +             pwmchip_sysfs_unexport(chip);
> > > > +
> > >
> > > I wonder if this needs to be done before free_pwms is called. Otherwi=
se
> > > the pwmchip is already gone and then something is requested via sysfs.
> >=20
> > The chip itself is not freed, only the pwms array inside, which is not =
needed
> > for matching in pwmchip_sysfs_unexport(), right?
>=20
> OK, then make this:
>=20
> I wonder if pwmchip_sysfs_unexport needs to be done before free_pwms is
> called. Otherwise the PWMs's representation is already gone and then
> something might be requested via sysfs.

Agreed, I think sysfs needs to disappear before the chip does, otherwise
we could have userspace racing with the kernel for access to sysfs while
the PWM chip is already/only halfway gone.

Thierry

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyHnGIACgkQ3SOs138+
s6GwEw//dTycZkr5tDV0cVQE4Erh64qAw0R7YJ91zaH9IGscdwfsBe/18QNHq9+O
czS/iBTjj6wy58+4AOwbQYGfdcVBD6PlA6roDQSaqt45xCStCim1NP5D3TzlYlB9
WcIhjMJCI/cKFyzENm8ON2QrxnLdP4yrQ9AHFR6Qr/N2I6SMKYIfq95CvaYqGegj
HIfrJqMxBcj8Tk8uifqxoG9I5ddbjIeZtHCqjgybMhB4ownUHrP8AofQseWL0T3c
uQfEfVnsG5nK+mIbQx2g8IB3pKTwwKdU+2CplKGXaeLBucFGYI0dHk/dRBLSsZLm
OdryDzIyHRvmDnI7PMxSAnyrgXgTDOV+HbrM4M9iFZN3TlzgmnM3OAFb85Kvn5dE
Cv1Ac30I1pyN/fNbyZn9218OmlwFLNswlXGYVFFrmyu8AbcAMruF2zwzbCL102cv
40hIIKd4HNWyMOGYX64BjykGwm71GKsVgna9H/KHq0C61L8OpaFiYEu+AYqUzL1z
4mfLUAq+Yco/fdwa4hnPgQOKMH8ecEjsjbhr2NFP4hD2hxIFFjur48dFzCyQc1Fs
gH7NQj+M6x3vIBGVNF9K+SGPmvvHcyJ3p1AdiNlUv53YCBOe+l27yWkcb2kQoNdO
wbnpogdQIkXBXuNveuMuC5z7AbB8evM542ZsDVwEHiREJGv+fQw=
=IR3j
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--
