Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042963A6B7F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930761; cv=none; b=nO6GksJCuGbm/MzGmnXWD/bmOQRUOKAi9aPXsGqn4ERiCm0WBKwcFKHnTbumHSVIoMJjzS79M6D3z4x2fWKoAvBotqUkbSYhZIJ66v7gsqgAF6hAjP2lZfWpLs/mNblyV1ExRJWSCpIrytrfIKFyEaMR/j8IxSA7Kbwmw04BHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930761; c=relaxed/simple;
	bh=Psfrc3G7bXxsl7ECubdBiSlZDy7VaNL3f7/IvFNPlmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFz0rl8AqPaW50xR3E8CNHwsy8sLAY88NwdyHuXongFNNiPF5UwYDcmPbbtL2IOfpBVXhMGIApnlm+485CPJr/1jpXw36bzqK1CMUK3A2XuAATaTOMI3cIH+fTtMo74K+aB1kRpuclO+dFEguD5P3UmQ1tc4fvAU4tvgBhJuFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdc96b0714so2150397e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 01:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930759; x=1784535559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK7IMBHRP2FdUnWCkfnYLPOObmzv4mtZRa495nyVkt0=;
        b=pF8XBRWaejiL3J+oDs3VMyHbgjvzh7KFGadYYmekO+OUfEG9zms9eZW61b86AtPy8Y
         dyDev5vABg8ZQ5HH+k6DL9YVCG5/jtxnIn7Qr6c1HHpcBI0zXXwI5CxHlxK2nAEDvoqH
         kiizj5thYZny6ONNYvcz81qyPnaREV7tB9mM0Fy4J/IINp1I87+QEfdyLJgqpCXWoBhP
         egY/It/J8nDOmYHQ0lvTUAHW4ffdOcf3LrJFPn11o/mPcTDqwH0hIhAif1e8u+FFhcwL
         J9zZ94JLbnmJZ0vOBpr4SJ+Tev4s0wu/2m2qBIHcqLf+RFLvAUYKKBnRfYb5CY4F+2/u
         JAYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9xyY8BPMjYlIKa38FkBo1obqAFrELJDKkvOL5ZUKtYMqVzpg1S5VnuBMFiERvanlXRyHdMsHBGTEL8vzuxmQdhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpoAH6wi7uNremNg2oMAgT9NkDPzaGfqzTAwzbjfBfmggsM6G
	f1nkMH7hJOaoer3ifROMCDrRNNkWRhm1bjM/D6Y+GtrtvRjSQefiRGn4lHAZSEUh
X-Gm-Gg: AfdE7cn0F7GR3Vxfru0m7LkIMaQs2UqgJ+vKONDdcV5BsR8z01tZf9mEXReSbETCuBH
	d+iilJJZgwLibNgSFrYuF7BbFtkkjs6YTwGI1S1ttMgiglCpgeMc3HCfPvkeiwjydSAds1bbhjY
	L/++JlFvX89Q1Atw9JvuqHKjYtc6iefLUnco3j/Cev4/l1V3mnbQcsUIaN3s8LasrM2d/uTFAbS
	RITjVR2MgtkcPgUZe0p0CC91pBAXu1cRp2Ir/tCHQBtfS6Tz6yLH3HFwjsbAm9mMC6yxSX7DZ86
	EeJqyGUh0qgAPP81085NQbHJLu+o0/G5F4tR6HCuFXbvgWUBA6P5xA65DHag4kjGP8xBuoDD2fX
	wqlzocEOjaDChhQ59MdOgFtPj/NseFPXo1qMafh7S+Z77H7JUV82kkG+0dS4V1SptzK7bTeAFeF
	WN4Q2ZBOn0cgESuLTp0ZR6+C9bYur8zMh6oVDRwRyHkjB13wP1y6IEX/MNOcy9
X-Received: by 2002:a05:6122:d95:b0:5bd:eb9a:4bb3 with SMTP id 71dfb90a1353d-5bfbf200776mr5464236e0c.7.1783930758955;
        Mon, 13 Jul 2026 01:19:18 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm9424207e0c.8.2026.07.13.01.19.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:19:16 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-737de525d2eso3006693137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 01:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp8TM9Xw6mcZuz4eW+2WoDkRK65RoTQRoPJaBQQdilaXliSN9g0r7vM+lCa3xHNoE8J4xbBJ7DYA1wWD88JdRzlcA==@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-74533d7c9f8mr5298165137.17.1783930755575; Mon, 13 Jul 2026
 01:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <alQTnZwVRwpVTVUf@monoceros>
In-Reply-To: <alQTnZwVRwpVTVUf@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 10:19:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
X-Gm-Features: AUfX_mzM4sxy25iOR9jBU-xAME53IzNcexx6a8MgetXZ4RYeb2wzLaySAOrHbao
Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Mon, 13 Jul 2026 at 00:22, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).
>
> Ditto for patch 4.

Thanks, will do after the rebase to v7.2-rc3 ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
