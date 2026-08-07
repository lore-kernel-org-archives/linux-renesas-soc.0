Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FFD42FCD9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786100704; cv=pass; b=tBsEdQN/I0IQatacFxzb9F1i7H7XGxspE5Xvu+9tW20bbxubhflAvcYt4py0rlgOLyqavaIlNUi8hxGq/iErEUQ0dznwYMkPLOHebOH5+SL55T6L3ALugJDvfgmrTxnhbNiD1l4fzPXyAZFHi8zj3sJ8YCpwl0BhTmsE/mz0HZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786100704; c=relaxed/simple;
	bh=7KhMblWPk9Mxjw0VSwSuCZtpex2QSzhBO4rxVqclDig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5ew2fjapwNkyp1Kol613+8pvslEZDU70gnNd0lLIRA9ds79YB2L7mjRlFLRmFgEmOL6XRa7yXvNtljdzkz+jVwX5SjFgRHcwSxufgYgsoXFPaZZa0iXeagLqw4fhPsN6feNOpH6Hz8h34+9ub0l03xlefJ45ODvf2YTvb9W2nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjxPWYnv; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjxPWYnv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso2277158a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 04:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786100700; cv=none;
        d=google.com; s=arc-20260327;
        b=UcCwbZrwm8OFtXTMRT3Nny5OyAp22c/LoPvKWtdtmKo/ffJLmVraBZ3g1dRgT9qp+p
         K6zEfjn0NNAcjV/S2TWI8DRxqF30J/4KkwIyX3BftzngPAaOHNHS8gE1oisRb+WKeeoS
         tzGoKWKytW6PyfFUrfEQAIalNu2icBZLMN0j0z/0hPZir3WdEohdUIp2OVYtduXArisz
         9fXRAL4CNXDtMJFnuACSAvFJpK4XdGBvVdBNAgtULA1CzXqpoSkhXziIYuDRt8xS+nZ/
         doMWgkFW1EMPwaLHCqrOCzee7xxFbhMhY7+HxNvLeosPt1s1/7srTlBjcMQIA2gwCAnp
         1Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        fh=vOA6iAhgJvEvQQJjwrldlyH2kcoK3pigGkIcN93B7Gc=;
        b=NpZYQeRQ4pr3kTwHhIANlmxy2Q1HFAGYdlyslLysErZNpRFfAbJJeijp55TkbifccP
         mfjHhvpnShXs6/WtsCQcU5Ziku3WRCQrm84gSSaG2MmurfJWLThailieNBNHkddHAfsF
         COnRL3ZLW4Rvn07Waazdfly6PuKT/DGPJ3grY6P/fOYKnTJKHHmbt+BTwc+1WV/vsi46
         TNuRSoHrFWMQVk2ewviP8wKvsHLIE1w0J+oVzaAogk4yt70C1mJ2/lV7YtL9iLtsvKgy
         O4fpBBpuWBizrwptqVyXxV/fG2A/wPC/AEpS2PxILDYZ04b/TG4Dp70p6CCl0a7qb/Rj
         wUAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786100700; x=1786705500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        b=pjxPWYnvqtTgD9d6wWVRFzczQ0HU90bmwUNzz6V3qoHFdWhvDNqdIcqt4aumV7a+Vz
         ynvSJCrn9m84x6zFJZyvhogftq7+phyM95OuvpEtU2qkpKj7kPEih3S/+RYnfFGj3BU1
         W/nWHypHtGRi0DTYWBgICZTpnoeL16vWpvXyM9TuRVEx0bpiOQYIK5ivaCFomfsyb0fi
         UfS8Rg1DhD8emqjRIzTCVsREqyixDPcIP7Wsnv1v8cSePGDsjCfHW6U3EAcRzRuAep+y
         UFiJq119tIqdMpckQmV6ZnWkiPDlg6u9wP5hIv+gu+igMzzDIiu/clVD0koLGw9Q2mti
         RbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786100700; x=1786705500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        b=R1ht+wHsxDRU+DzArqorW0k7iKpGJ/pF/lLxEszhPhTJebbDBUr9lIWAaGlgdM9Buu
         DBPvKw9GbTFi9AmDoyA6SWU8pOooASNqD8oXHBEmE5ULRM9YjZP+7w6Vhws7OdURa4iH
         Xh3CTfTsg3BXNcEHP+8EnGxrajyNUgq5DkeYERXAWVEYvZRvdIlL1BIfejIRkpNjbTra
         MhvCgHH9b13/oy47YH3+OQmmqyG90TUgFzepORSa19+QdB1dR/j15ZrTx3LjgiHqtxvd
         B4kBkpkfct5AJod0r5gXGXAHQlUKxpAgvuZkKFw55MR5nfhmpm3VgLoCIdbdLQbr3XoX
         l+Tw==
X-Forwarded-Encrypted: i=1; AHgh+RoLW+p4BLelveW6D+v9N+sweK0ZFFVyMvo1KG9ItA782ZRcoeyP1UeUrwKXtIGbj0dowPOLJThr0hhWyYYF4vcNeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuFVCQp7xgsxoKp8vT2SiRu6sg5GSKaVGQ++wFwuOrQryTLMS
	9cKwC8qxKxs3qhFATp58Uc2MhsAfRJRKIQabQd+e92CiQt2dDF9o5cFtrptEE7YmuAuB+i47jt3
	pLUwLW004HZvZHNAzWxjMT1KbhrLlaSM=
X-Gm-Gg: AR+sD12krLhnUh9l6U+KdigGFSXWG4GEVtZ4SLJOodg2ui1gcMqUtlujG1KQjt7Hbjj
	cBkFeV/TZ5vpf1GT0EHs9Y1l3w9g6eWzaQrfq1g6iiKOlnT8aUGxzF8Bg2cz3tq/p1ZtJR2lM+e
	oHMyTz/rwvyovByYdQAAiZzuIyk2OWY+qhrEecMDNvhc8epnfdzns08zoFXhj7pdZ2limat2FME
	mpo5QYb2ptTWNEKK5ryqOiPqIHiSeejGNi8PXo/FKJgYn5eQBWnRuGuSAyql4jSVUemlezMTIab
	PRep8t70BINJx9sh8D9OF2soyzYjB8VlZdXf2crgX8XqZFSixA/kzxA3W567locSvR+4zDobqjN
	L36XIlEAXjOR3YSC3nmvFAzJoFtDWQ3pb7JAvdpC3dK9bt2Q5NmRSvus5
X-Received: by 2002:a05:6300:670b:b0:3c0:ac0f:6558 with SMTP id
 adf61e73a8af0-3cb85e99259mr26552578637.2.1786100700044; Fri, 07 Aug 2026
 04:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com> <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
 <CAABR9nF7sAT4C+W_qE8GVKhrtTjdm=DcpJH548RzFaYLuED+3A@mail.gmail.com> <20260807103645.GE1316230@ragnatech.se>
In-Reply-To: <20260807103645.GE1316230@ragnatech.se>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 18:04:48 +0700
X-Gm-Features: AUfX_myqnP9cM0o7YKZHIMOZ9idGY0mI36nu52n1v9bZ-QIC3TPihkA-_6FUpl4
Message-ID: <CAABR9nGAY6BjA2mRsv+2hkB1kv0QDJX6osXyEMw6jsjE+j2+vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas S=C3=B6derlund,

Thank you for your feedback .

> > Regarding the caller, I only found rcar_gen3_thermal_request_irqs()
> > being called here:
> > https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesa=
s/rcar_gen3_thermal.c#L530
> > It does not appear to handle the error return there, so I don't think
> > the caller currently handles these failures explicitly.
>
> Yes it does. If it can't get the optional interrupts the driver does not
> support setting trip-points in hardware. No?
>

Yes, for -ENXIO, you're right.
The caller treats it as the absence of optional IRQs and disables
hardware trip-point support.
However, this also means that -EPROBE_DEFER, -EINVAL, and other errors
are currently treated the same way.
The caller does not distinguish these errors from -ENXIO, so the probe
continues instead of propagating the actual error.

I think the caller should distinguish -ENXIO from other errors:
keep the current behavior for -ENXIO, but propagate -EPROBE_DEFER,
-EINVAL, and other errors.

ret =3D rcar_gen3_thermal_request_irqs(priv, pdev);
if (ret =3D=3D -ENXIO) {
        priv->ops.set_trips =3D NULL;
} else if (ret) {
        return ret;
}

Best regards,
Phuc
