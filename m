Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4A4F3EAA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787865; cv=pass; b=Wy0GvrpYM0S+oKomszTpFaFiorcueZEyQJzdXc8F0ZqsqIpGTiPE0960LvW0XKrHkBDSMxInongB2RsMTukh4xrItIOmiVCJexsd0u9SONeGacxhvxqA+GNhSMVBOR3+EgISQMHoCThFk6kWQgfvd6OzmlxpVcD3fPCcBEag1rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787865; c=relaxed/simple;
	bh=YPB0OuzgSu6bYeqdbKJsDvFZ0QIOxvCezfQ72jpnedE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3B+OBGP7vUx8bzZ8ZCBApX30cr4QMB7XxofbVb+VS5u30nwZSjAc5ewZhp6QWvJiAzr5BQkR++kUjQEqpUSkkm0mnpNPBBSLr/6ClWwMKI+mkUg3lqIvJOFF+mSWO59VyarQiEUbxk2xfc3IZ71DZRuWvX20wvNWpYleiK81Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivTyT5JU; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivTyT5JU"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso3549032f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 10:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787863; cv=none;
        d=google.com; s=arc-20260327;
        b=SkBGkahTmU7zUWOoksDBa2mC257l7U5OxctSRXq0jrEm2kAjtG6PlbyfqQcTqXv0/8
         uHxP3Y5UqzPblNzmZ/9fqSNJhsOZg2ZkWV4DhOsR18QSVPXt6DyBPEbSSwcmTIrKR2w0
         tTAt3japHdvaKOcLT/nS2hNx/drJAE3VkwzO8MjdDkN8ubAv0dRyE1fCmrW/qEWlUbge
         7PH9fClkX8/sbEGfq6b1MPb3hR9PSP+XvN8aqv5erNAl8pcZyYTL0rew35GndM2B+Clc
         /4nADAN74Idak3iYQaOwQV0EYyHpEk9xbG5v0R/eq/Ozp6l7ZKIWxFKo1J0BuE5Q9DBY
         +bmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        fh=3w7triAWfJk4ogC06n4yRwNtHD1c8BpB8QkKsP4Xr4c=;
        b=jH/XGqcMNEXM/hYieLH1puBXd7C0l99+HlImzPD1tS3zZwlMFeMHjbVGNXTv8UK5EI
         tCQJ4q95mGbe2DBznEGpdfkaK6insMaaOo9rJLRyL+i7kwIW3nDL7+drc/5RkF2ajbEA
         cb0vzT7Tg4xp5CvQN93wCg61n154knWXQW3RVp7v9NSoHLx5cRxdI/NDHcogXq+RKEzl
         9nU6kNuiK2Uu/LVUYe1BynjodHggpwaOJiLaXwAYx8hCeBk5sRbuw28FhByfzYSdnpfT
         mAUDhiEbVUzllfNqEjDlqjmg7SBhKyDUnz/Klb+sV6YMPyxMyUDcDbhhGNH00LbMZ+zj
         MLaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787863; x=1791392663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=ivTyT5JUHKeGqQuEuNbfdAGYblvHXNS4/cO+fgAoTGcyxuty/wgF03oAUMwj1lM80i
         lp0f/IBpZKvT2slcDmaOsfl6LAoSc19DgvJlOJRXn+OQukYfFWu1BlJ5BVCNd3ImmpPc
         eBKqB95iAqIn7eWFOAoQxmZG7v4Y3fvy7vllRxa7mfnOORdW6rbHcVmuI0qVx96C5efk
         HvrKNEKcYn9yTYyFKSgMWj/sf0T2+Cf8L0WFXC7pYWmf85Hu3ttNEybGwuxhu1q4nDFm
         Z4JJskBc9pGj38DTriJuzMWfv1K2RkxK8kfCthViHRDvkGP3q8iODb4iJ0Y5XAco1fcX
         QfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787863; x=1791392663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=IazfLQk4GePoB4JbltjO8100QgWOzyOFJlJIXdIlrm1BOKrx+s+FDtZ3Rf+Abac3RP
         Cyz1EBnSDcTdRc5T20u40CxGzCXztJAQ3mqJE9Kkpe1xMzCEmTz8xcerT8MRnds39yoI
         TIGZLe/YCdegVK/SZRcmqukZWByoz1AURhbEoYefw0tzbmSwQAyZVeLQy/VFwmn1jnXx
         48Olyz74B3tqGOmZnVlvsnJH0KaWcsPQDFpuNscVNaSl2SL6F4DjevJ0l8iuonRh4mRz
         9SDMWdiWX6mCwKCnyzJGCU2kVa39Gf5alMB8nP9f7C7FoOYRLYH5WfLcnqu2Rf3eC2+u
         MKYw==
X-Forwarded-Encrypted: i=1; AKwUvBzAtYGwW5Ka4u0wroJ4uxwepG5Og8zgfaCZz8gqZhNrP4IJbTK+Ie53yBbXzz8bCITAsXtLHSlFg321I+6IVJ1q9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgP1P9UGSqhrW3UItKrwUgWQGtFu6ngNhnL6p/FeG3HCGUMhul
	D3R6WNN5Vx9S0KWb2JMcDiMWwY53mbe8bOmDW1Nv6Y5nUTPJ7O8+updJNTZhAmrBirURIqpXgYU
	sTZpIV9/cVRnA1NoQZwA5Gi5ScSBSKAU=
X-Gm-Gg: AYBFou36gMmmu0AdqqT05RBo9ATjPdeqUhskmFD6/+ynfHjndCKNWkN2NiQi5gGiiDd
	O+9AGP+RjEce67J73Ben9C4OINu60T/4W9uezjdRTyyoPWwVkEANg+iLhBzLWR//GBelvtMe3XL
	rNctFuSilpb1TLQOk1jdzUqQQP3G+0a1abJg5pvNco0/JFhaviDXVkjNJ9o1Vg79olUuN1KT/av
	Z9a+TjU+F8Td3lcpG2nSUqzgyUH2UJmXLRJYUTQyauqd/MVO5k/xHnfRI0ic6Jw3I+5Atvn8S0O
	Nw0neLhjz0m/bDKuAZXL6pkoQNUYk2E+4PvbQA+Fow56RC4J7tDkTu6ti43aJoGffIC86KxZqwq
	M/SCh7g9IcknQzfSUz7H+PS6suWscQ4OzDonYFBGtztckx48WXc08vEAXtPFT5SDpxUPeoAZ+E4
	4=
X-Received: by 2002:a05:6000:4283:b0:487:106f:ee31 with SMTP id
 ffacd0b85a97d-48b02524089mr4421323f8f.27.1790787862365; Wed, 30 Sep 2026
 10:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzWMViKacekCSdS@ashevche-desk.local>
In-Reply-To: <arzWMViKacekCSdS@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 18:03:56 +0100
X-Gm-Features: AclHuK9LOI7GwX6WVy-CRezdreahkEzOs_5YWlyyazInLnkw8984BuD6XWEzDWY
Message-ID: <CA+V-a8swr65n3hnGA_a2L-uGfLbzAKeQ3TqddjcyC+iWF52Vgg@mail.gmail.com>
Subject: Re: [PATCH 7/8] iio: adc: rzt2h: Use scan type for ADC scale
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:47PM +0100, Prabhakar wrote:
>
> > Prepare the driver for RZ/V2H(P) support, where the ADC supports both
> > 12-bit and 8-bit conversion resolutions.
> >
> > Use the current IIO scan type to determine the ADC resolution when
> > reporting the scale instead of assuming a fixed 12-bit resolution.
>
> ...
>
> > +#define RZT2H_ADC_VREF_MV            1800
>
> _mV (yes, as it's called officially for millivolts).
>
Ok, I will rename the macro.

Cheers,
Prabhakar
