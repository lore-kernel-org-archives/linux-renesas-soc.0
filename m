Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154038C410
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063864; cv=pass; b=HXv7X3wpO6wMNqHVlc93CbVOczoaKsdGyOVEhy38k1kh1j3a9URPPJynXeZcOaBkFNb1YJqhO81DiRYrm6VNeIoQBDxQiNlnHTus14ycasz9J3tykxixK6TafLb2cChtQSOOyVzy9rBtWfgnhZlcMER767czpVQuq4SN9yDjsOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063864; c=relaxed/simple;
	bh=IBSqBa5sZuE5sG2ci2wFJ2FoiGRJLttrL4EX81T6A7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YI5BZOGNB2HZdzvNtOS1e/0MBfaMXo8CgoNsVFHbY5U1fUOGbx/6pFug3o87Bi452kcDMUz5yFV0JMq0oYyOuJwkhQewIIS9U6s04DT1geaR0hJj8X61IurNmPnagIZL/KUOcAmZnv30GighjEFLCmKnKCSlzCWgR5hBrwevuAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E24Sqg3O; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E24Sqg3O"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f904e80eeso4575096f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 07:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787063861; cv=none;
        d=google.com; s=arc-20260327;
        b=ShXcXY5nDjugm7yHI7dAdByep2p+db1Er0sejzYmqc1LL9QGKThf9Q05MWhV+rOS7s
         XETb2S/ketBnSnmUOSzOkGp2q/W2oINQRpdgZQsB3u01TF9u2BPDjp9dInXVYxtJOCaG
         cXVa+OvTp+4W5GTA7GYoVdufKREOpB38g6E65SbfJRe8hN3axu8WqACbiTCwYBV6hjh3
         k5TyE3M4ScRuhWxBWyPyIbClkz0jPlPreeMhe1w5Le5jUVAVBG9S63XnAazhXK4szf39
         +6O15tN764rhtl+Xd0Xz1IQjxtEMCXuwYYRKpOGY/JomhuOUbz21qVGvcQaFPiHOI3p+
         5cTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        fh=chekBQUiD3mf4YNpLinMq14LV3aq4HqZQqu+TH5uvds=;
        b=LUDX2s6J80DgQfWUiRMhMksfm9WA3QWT+CiPhuvPBstsUQQPMnl2wVRS8X/T1B8WKP
         ycNeMkiv/BS5WipHQnqUAcm45XYVRiJzL6yKIAe1fPUZZTHhjnzQ32YTvaf8Wt5G6CJK
         GpxZBmHZHL77udK4Sc8HP1Mgs44PS+sz9A5HztlIjnIhmqAW/zlkgrKh2Z8UWU/CqoZz
         bqLYidE+SetbVI0G2H4ZdqZVN4HDIEeDdEoblKAL60bAiybSIpUrBl8UqNkmIiNw8AIr
         EGTJvAg+exCUVyJmRMa6j39bAuKoUqqsDyMfUjLWARRWwfOvMg9P6J6cHef3StD4UnnS
         rTWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063861; x=1787668661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        b=E24Sqg3O+3Jd511y+cKzRx3tpy+SZNq5wIYMFN30s9983UipPXlGuoABWRLSZHDwxw
         fAF3+DcsWsDH2A/u2h2jRfig7k8XGzCQM26JijOY2pnsTxaHEQAkdFcxqBUsBIdUARK6
         4P9Ce2+n/MRCT+IaMTMVjlo7VhveSu1c1pA2X+mez474R+4q7RRIMjLRJ/Yrj713b0b3
         fTF/+OjHOypaPn33buMGLoYU2rLbjpFH73WrzhfbxinHBbzJKWayznwhN1Ls1Tayz+Zp
         vTxdzPy41cqg+wK3OoxgSJVh/0ZBTnn5VaKa0cKih4v+RO71dbh96XjuJX1I2s9e8N8n
         uOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063861; x=1787668661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        b=PU/SD6Ad2KOplv9ZMGVLbzpSWA8aqL44o/nrNbfRev/ioBF7aig7e8aIRJ8lpzHkE7
         3Ksr3e52WqpGDRXuKoplnHdQ2aoHJ3yeKrKSVnj3PH16wofn5nNTOQnsD62Hre+NfOji
         yIGGlAHdVS5K0YsJD/2TupihFwlTmEQuYPGkMniimy+ZN4xSmeSWkvo7aqlijAGw6kGF
         xivWHx6ZAItJXNNek7Szn+UD1WZ8jCfOUQiR83KKvdL1di7I3z5tyRALWqgSh1mmIT/u
         YYzesaPicNf9nFFmZas2NVT1XpU/07FbUg5Dswl2TsKY6lfErE6C02kT5P5bw2UjZgO8
         /SoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrx3hVA1zOtmdknOpgmLszMsWNS8a9Rcw9WuFZxVESkCwsKnFoZsBCdLziETZ+LFvO0H7LNZNsZwrkZcS8Im+jU5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8Om+lvdWuNZT3FFlsSQGHTBpQjdp9E38IHL6iyEoMXZMG+Zm
	qFNHvjHw3h5y2jyS8i77oQAzGiPKNY95dVxp/KRnhNKHRCEQYdhFCuVwRvv2eZ9qDI3GqcqkaZ7
	UCYv066Bdmd1ZqnZe9JGylwNa6XNbjwg=
X-Gm-Gg: AR+sD10+4zUOhbgdbIrHuaDvxoecFc8k5H72LbMUqAO0wrkyGh1Av37/z4g9bwRlaDg
	lT6eWwzwSTAQmxKPTh42OqhcY0QkFiNZk7pD5PhU4nb7G/8ds56SQjwqzmI7xf6FUmUmfJNHVjv
	tCGO0mQDOc4wBqtqHpJmsN3roGGE+7lDr0orocjqxHoFfyPuG0nvHbjbWHVwUoDKm+t4GzuvScw
	t/uZvLgzkyUtun0sMTBYuWrUGhLiNS3nsz/eYkARwwNMFZeTzWq0leileNGY2NJZ8+Ch254Ig4p
	vK2zgxE+74im6Dl9zswg0mCPAgZPOAMhENbQRrMb9AkNJPmC3OlXCH3nqx5i5leovPLq6CNz1No
	JfymaYC49G+Z8NgfyRGIhNjSyFuri/GkViDg4XTh2IXjkAmvsENT0yqlPXIQ0gnY=
X-Received: by 2002:a05:6000:4387:b0:482:abaa:fbc8 with SMTP id
 ffacd0b85a97d-482abaafd4bmr9687806f8f.2.1787063861449; Tue, 18 Aug 2026
 07:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoQ4nMR-NeV3FFz9@ninjato>
In-Reply-To: <aoQ4nMR-NeV3FFz9@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:37:14 +0100
X-Gm-Features: AcwNN1XTiorvtf8oIvzxJNwW0UUvL1-YI7zD4R4i88syKxl9raPTSpiWlkJvKJc
Message-ID: <CA+V-a8uCt2_Vc7A4iFuiCKmkcrbFCi+0_uoWe_Xx=aT9=Fz79g@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] rtc: rzn1: Dynamically calculate synchronization
 delay based on clock rate
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Tue, Aug 18, 2026 at 11:49=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > -             /* Wait for the counter to stop: two 32k clock cycles */
> > -             usleep_range(61, 100);
> > +             /* Wait for the counter to stop: two RTC_PCLK clock cycle=
s */
> > +             usleep_range(rtc->sync_time, rtc->sync_time + 100);
>
> Hmm, 100 seems more arbitrary here than in the original code? Maybe 2 *
> sync_time like below?
>
Ok, and I will also update the comment.

 /* Wait 2-4 RTC_PCLK clock cycles for the counter to stop */
 usleep_range(rtc->sync_time, rtc->sync_time * 2);

> > @@ -444,12 +445,20 @@ static int rzn1_rtc_probe(struct platform_device =
*pdev)
> >                       scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
> >       }
> >
> > +     /*
> > +      * The internal clock counter operates in synchronization with th=
e
> > +      * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
> > +      * cycles in microseconds required for operations to complete.
> > +      */
>
> Too wordy, this is enough IMHO:
>
> /* Calculate the duration of two RTC_PCLK clock cycles */
>
Ok.

Cheers,
Prabhakar
