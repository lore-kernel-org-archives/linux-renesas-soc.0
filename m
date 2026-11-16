Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820463;
	b=EfdyD0FX2WLoIhtIrhL32EJ5HThLtVmnRaDBNO/hwZnPT6MdcJQWCgfQNUtYSEVR7mFm
	 uMQAcz31UlYXKWmJ7j61v2G3zLhYrKRPWmDHykpDcPj+AU5J1aYm9mlg6DG6SokAaH96T
	 pjH4uXAMW1PKaeGgyAFFvpfkb91u3ooWcVi5UZL8/o+Ae78K0TF3sFH8K2NYHW6Q7coxD
	 SMHsQC0DMFT1einR48rzuP7b0W0x5YJnId2V8soNn5kTaxfx1Nv6fvgk8nHfAX6wx/yD/
	 bVLDYZFsXjL/DbrXxVqaGFH5JWD8YG/4ICnWXc0vvaU2IA8Q6SJcNS3Q/y7PhKuRILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=;
	b=CDmOhhYlOm1wVKbC3+Jr4tlPoL4U0Hy0vxmEV/u03itW9RZf+DhkR3SohT0SKLzWkKep
	 P/5HDsTqqotNjSmV6ZLJi34vOHmM3CFon37hZ6j+8V1Wisvj5Pce+gOmtcNkpyMJjwzcP
	 4Kw8zzHdjQroLVcnN/u0dV8MMofICCtq5ZILp6BTrm0PzASGY17x6YP3ft99x4A7wZRcM
	 F4y9Hr7oI8eWqdSyWjreA76JvI59YHh7HTEbPFLG+1qyI1z3OgfB2D58GAuKpRCRrIyns
	 lQ81WAU4LPLGw1fzgF43K7AQD+r3z2XNfORfiklfGs1QLNu9D3usR1WmgiWuTVwYcwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b0a3iGWr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19A606A329
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD19A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b0a3iGWr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so25451035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794820460; x=1795425260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=;
        b=b0a3iGWrhf0lSrT8W5PZ3apkvAjkLzovGdk1hHP6fmuZKr0QgHoQskCMS/2eXD8s1H
         KMlOrWoYP2COhV2udxBxwK3o35CxHUhhuUrA/gsxWN/ozahfqeYoF760rLEDhKWIf9J1
         qdrT6VnVDZxSlFoyG21Gp1FxTNXij99MBVUfo9iJxRy/yMfTJZPqEIGSE4gOOqSCv8iX
         ADnrBEXLVfxAyBDtPbyu8KzXQABpCjhC8TzviIGKLh6Ana7YjdzUvNiyAee/3o8oN6L3
         zijZgQpZW15/LdRnrqhdxzbIDH4YtVKirByXJQPFA2vMzaeNSUzuHGaW5+jHojV5ACNm
         NOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820460; x=1795425260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=;
        b=YueTeF+mYWutAtSzKtjo2fAJL/kI8wVJywmEeXPZ2A9EO2hwDCqXBmUuPgpmVW/3Dp
         kFcLrW9YCERVY25LHfD3IaFnApgyrx+ZivpcBEuBp4xXgUH0J+DCz2Y6zN1pJ21jCEdp
         RZ0Rng5/2rC+d5d4KhMAgdo3SlmmFhFV+/j50OpMagAp5NuIqhyjDOOjdzJIkWq3rcxy
         zYbRbPdGeYF4dn/ewzIFoXn8gCQqsr7sfrAL6Vtw8z9Rg/ZPLNcmv8wEy6PLEpMM4v8C
         9UfN9oqO5w7LgftnqWDEoJiDzdmCMdcCv5wjJVBAiK1Xea/E/JF9pzAg5DJGizbVlson
         MHag==
X-Forwarded-Encrypted: i=1; AL+hErEMUNVevt30zHQA0kYVCtOB0zoUjcGiD31uV1h3ow831E6hkXCtQ8dqo/hjsfMGRG5Xav4mLCvl9BfY97ZXK3pMjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WP1wrkcIngT3xjJwM/ESXqIOu2WoEeF7024sXNMJnRvHyAmks
	SwhfI+re3b7QodUk7qttXkGRHmNKPSSJuSSHlCDSsGZ+k0uLuyOw2N5wM2B+1Y8OvLo=
X-Gm-Gg: AYBFou3Sptm9SIf6jg5JeMmoj7NxD5CxNUnAMXwhyGADl5oKg+t+PpFEFAqvRtZGKXb
	JMwCeqSLkNHqQ/4740RP0jbU33VyHtp1L9NWsw6S0AB0M4r66vaIe1vD1afIGmXwLfw69l91wBJ
	J0Ca+1gFsom8ysrie4zuSavg/xwKhlITGGZQGivzX6ogSndh9ecXf8iyZJxjPMe3g4GBwT2fTvH
	HGHupUtg3p/t2Q6Uk7OTVZIjjeEguxIfFsRUNYzi6ZjOclMSDQl2ziDfm8X6GSQxgXmBgtSv03O
	I/lpkxNy5xfQ5heogNC0xZoS0e4dlquZI2NkxDWk7nG1MCapJZdL5zSPqPtAkY1ygZpi8r0bevY
	fVjvZuxkbBGhM+XDLQUDtgOLyBIMBrER8Vf+pJdNqwinoS2AeM84SJcR+JZT1suu7cSFm0NfV5x
	GQUw7Wi4cY4cFxaCQqUZcA36DwWZ6AdZqVgGGRLQsvi0Un4GG/2FEd2ETsv1iLGSEJU6RCe1f/k
	aF4PMmDTXoFZv/s1fillA1aD8NXWOgb/pMbRXgAKgRDrI7inbK+7OSdErn0+076EIVA6AxfVskw
	q6L7eNNjplJpNm8lPGE2w5viSqCZMMubu5QgC70rQz5dWyGK2SURuRkPzaU9YnG27ddV4Pa8698
	hNSVRQhmzczqluY6qXw==
X-Received: by 2002:a05:600c:1d10:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb55a65ea5mr192703955e9.5.1794820459865;
        Mon, 16 Nov 2026 01:14:19 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb5faf05f8sm159998655e9.10.2026.11.16.01.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:14:19 -0800 (PST)
Date: Mon, 16 Nov 2026 10:14:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
Message-ID: <avrHkaYw-De6nv8B@monoceros>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3kbn6dvhzgm4gtvf"
Content-Disposition: inline
In-Reply-To: <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>


--3kbn6dvhzgm4gtvf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
MIME-Version: 1.0

Hello Marc,

On Sat, Nov 14, 2026 at 01:56:15PM +0100, Marc Kleine-Budde wrote:
> When determining the device details was reworked in commit 5e6c3454b405
> ("net: can: Use device_get_match_data()") there was no replacement for the
> previous handling of non-of instantiated devices via the device's id_entry
> which then results in a NULL pointer exception. The only in-tree provider
> of such a device is arch/m68k/coldfire/device.c.
>=20
> Restore retrieving the devtype_data via platform_get_device_id().
>=20
> Also a device bound through driver_override need not match an entry in
> of_match_table or id_table. In that case device_get_match_data() returns
> NULL, but flexcan_probe() dereferences the result.
>=20
> Reject devices without match data before continuing probe.
>=20
> Fixes: 5e6c3454b405 ("net: can: Use device_get_match_data()")
> Cc: stable@vger.kernel.org
> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/20260618140147.142489-2-u.kleine-koen=
ig@baylibre.com/
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Closes: https://lore.kernel.org/all/20260528-fluorescent-sage-ladybug-432=
61b-mkl@pengutronix.de/
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index 86b40abe9e76..2bb9e4184eb5 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -2148,6 +2148,11 @@ static int flexcan_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(regs);
> =20
>  	devtype_data =3D device_get_match_data(&pdev->dev);
> +	if (!devtype_data && platform_get_device_id(pdev))
> +		devtype_data =3D (struct flexcan_devtype_data *)
> +			platform_get_device_id(pdev)->driver_data;
> +	if (!devtype_data)
> +		return -ENODEV;

My stance is that the ability to bind an "unexpected" device via
driver_override is something that should be handled in the core, see
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.179061=
2298.git.u.kleine-koenig@baylibre.com/
for the latest patch to address this. I'll work on this patch to
hopefully get it into v7.5-rc1. IMHO it's ok to not fix this in a driver
specific way now. (And then my patch referenced above in the first
Closes:-trailer is IMHO better than this patch.)

Best regards
Uwe

--3kbn6dvhzgm4gtvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr6yV8ACgkQj4D7WH0S
/k4KnAf+I1gQa7nnydreBqpl18qr3bjlMpNbM/wcIEtGP3xMBPkpDX2yJFljOI8k
9TayfHIOvCINmFKVvL4sioue78+dQP56QUAmZGMHZNnQd4W/38CNi+PxKIqgsV74
yoJHlZhYsHSMLMsf8oAIKAGhkVtpziLJ88i2Yc2ghjZ7erYkKrSuBc+jFTFzI4tM
OknkKdfObSLN1TAr5lJYpnpvCn6HNJOkz//vLAgu6wAYdV9WtAd0wrkm/4tFcfir
MpB/Cw/PNtHNAZWiKPL50rum+ferNUNUzHrRAEx38UA5Sj1Nz4MQonl0UUVFoPIr
tgcOC5iCUQKdoIJu+AnDEx5AuRV1Dw==
=98Fb
-----END PGP SIGNATURE-----

--3kbn6dvhzgm4gtvf--
