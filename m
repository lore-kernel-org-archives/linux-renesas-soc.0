Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28B3AD516
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041751; cv=pass; b=u5pMf4FPRAGB1cbfj70+POPDAuYM3Rnh7gGcbbIRG5fBmirkEtkXYRYrjRVOGqTSDl8mNTG6nSx016I4qALE96KR9ylRAon2WDsI3Ov3QmVHn23gPHtsfyFKy41HHvB/mUHy+F8J8EIYsD0vVh1BDsehS00CK2wE+DADyQ7izzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041751; c=relaxed/simple;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dz3yC+TfUMJP+1jQSpVeScMdh3P942us2Yquff7O/dSCMORmNRyYvjDAM2M5yWW6wfBBz2Zwnm7q9ZCzdm1oGu+BaQiupt3d85Dik4LsNHdwklpG4aBb5+y98BePDQKgnnK8GuXR+wNQ4dY7lURMfmVa0eT427PGyNpDiRpRZCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyzZTbtr; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyzZTbtr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b458ca2296so102659655ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=dP1THFaRzaeOsvR+RRGlAaOP/HWWnuocSQWDp5of4nDVLxlN0wlhjRfof+KvVk0sYn
         eQ5gtuTFVo3av/leIhCrhUmgeuuP6UXuOhzx8+VvTVuj9W641UocTLJn3EWTeHxuFq+p
         2/Upd75GdngKC2804fxzL51J9PL0RYZemS2GOv7/F8iXrbAyeGgcLIPgtqsAaEjwmV2N
         qSM+LlvE8iwjtgdfRivazuE5oKG1dSeqRShuElSUGbgG+fOna3jsNX9M2QOjFIw0ticw
         4IcpF0+UJti2BSX2ZEJxO8NmPwqkHCzmc0mQiEi4/GEMuA7cAZzAn6fwkuAjBgNkv26O
         eWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=56ItceBgTSlL4MmAfsmSAv4ndkdfqBlAgOYZeYdThpc=;
        b=Zjb1E9l4ctm9BpqfLs4w+xnhGPUWnpeCpQ5VLg3AR+JrM91giK+m/DO1XryjFNDAhA
         ou+u84P7ckvUaxc++Aktt020pJZjtkh7ssKkN75I8Pe13ffgo+aofBMM9Dw9LDTKQS2x
         nhg4Wve/GFxTfVZq/75jPP/CeH+kd+C58cSjYPF/Tu34G0TWrpjm/0YNY/OxXGwLZBaa
         FMawjpwx5/WnJFSa8pMVMtGmB6tZGT3NUGdFM6j2jF/7QPEfaydNZQZ6Maj+V6Qsf5GB
         3JxnHj8W7UYtx/801UpEQ1lAozMb98OcMdVKyxY9SNDI+TCF5Mobv7AMLDh+vJPh9nGV
         KLyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=DyzZTbtrZ1n2pUax8yd/K5VlIptCfq8x17Y1bBwWhPrIij0QTiJOPUXga9Wk1PStt/
         Z/UX82Dpe1ItakllYC6viWCR6Nre9Fnb6f60qOEMga+MfWzZ9OF6lLU5CPCWDvZacO+0
         KvFL6AHvHXA7EM47EcHtijw8SuWz3liQi0gcdlWIi47OWjg8JDj0BULD+kZ29dnPnP4k
         vUtHvuLIgjrRORImdUB7i4bk7qjvA5BoJixLH8dryHWOir77N0KT8m147f2PoC5TxDye
         KSSpFvXYuOOLLoFaA59M593VjSX5/qQmA2vbWvJTivlCCErGxgg5GEUYH9Qkc/j/nQ+5
         Ycpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=Pgiqzu09jaSahmfyQi1t8q71ALAcMW0O8NilV5fpFWyggloztC8Hh/D6DxBovwZ9t7
         BQE0KZGA5915loB+F23KY7jxmL7cW9Q5ZK1mn8JJ0WyXMi0OOQS2nwJxAPiYxyi+AhAk
         FJUCv4vS+CWVdRH3jpvm7zYufi+6WMVv4FHKe3SjLNddIccF7D++Q6T47AXOcR52uL2e
         0Mk0bYu6nh8BH4QA4krgEATGBEixB62kO4xTIvxtT91Nw0ALLfKbGVxzQE+9ONg7NeHK
         7Onc9HqXPgy08l9HIloJ5UqGwUzgO0yKce9TbXaotM6zuLflr0oKyPiomLZX3zwtLQOR
         JZug==
X-Forwarded-Encrypted: i=1; AFNElJ+J2M/XsCId677GaK4LS7rxPcXwrD6ag+mHGKjlPsIwxPXLp4/XS9ENhMweGS67tlfoSdLbngWguc0ur3ylLSeGVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1zXvr2zS0TpJadKV5qKEJE9gwtpsZimgZIRRSaxwIPtOB6t2
	ssCODOTCCpNCCDE5AHsE3Vt/UM3UWLpLpVTo31zJO5NtUi2hPZDbVv6NXIjEJuFoC8mhuZvi388
	yiUehBOV6ldXBpQqZnWQ3/57V2EWlRd8=
X-Gm-Gg: Acq92OGzh6U83+HQ2HhKVBNz1uq8xkT/55tFSSth388r1G8M/fFBEgPz97J5O3aqK5p
	pVO2rQ3Gm9CMd55NfYn1VXHljFRxVqQ9PCN6H98EynTwwiDAmAjWuU36t7eNHNsgBHNUbNhISiO
	Idk5kzIWDoh4P6LwPxO/0EbNgih8QyUYcOrJOeV7gYqIyJOYNmDrT867pNlp/rwQyF5j7Tc/gJU
	2VLUPt6An2sqWaSwflewcTGezzsAIa3nnX5OEmfcGORZH5GNrIqNdNKSTxCvEN8NhTGFBfg8KQ+
	sWNjrmjZaJ3EfS++cKw=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
