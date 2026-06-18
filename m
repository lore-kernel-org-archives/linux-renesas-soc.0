Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7013E9C21
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778314; cv=pass; b=W27UZ/i+SkaeIPb9G2tkp2zY7JGYkcrs4RfFMRddEu01EijcjH5a1DN5CQpc4fh5hyy7WGKjB/Xu1kbD3yOUg7C//kX9IAyfvYl9lw3IDEcep9yj87eo60Q0bJMZeEaxIW+RnfKVNa4Vb0lbqBSzXaSZ28nuFkypuIgosdtZbzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778314; c=relaxed/simple;
	bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IInya9yrrGMcjYv3ffseUXFVgCaVd+y2eeF39FNTWw8r6K3Hc/fKSTUTS/JYMYK5vkBwNk+MyUeKBU+28EgKC6a/Pz6tDQM2ZOo23LJmk6+9nUvFSfJPOgfHVkZ7GBmf/HT0PlyPv2Qob920UxQyVDkW9hVwP6mhvep44E3vRxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrO5TUnt; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrO5TUnt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so5717525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 03:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781778306; cv=none;
        d=google.com; s=arc-20240605;
        b=Jv/NpADPqgXwZ0NgroBEVSCJu6hwcx6IJs8VX9YwczXX/nUCskEQt0kD4aLcakKSDB
         kH1gO0JtmgcDqJWlBAPeMLCim9Kg0VDLl7j3RFkWxpf5noPkSR52dmqTfCnTxoiWbFtj
         7IgQQl96I8d2dz0AUMqvYBHRhHAKKFhEuuhv7TG2VW2vqHxFywzuXhnL/PVpJwI7JKyX
         304l1K+yHORdW+Pgc2GQ/UnL8afs/VelsAtzbCun5iC/fn4NNJquRjOX+xJdvMNYfzls
         J3BRnm7rbb5RHT1qBxrSrOV3TbGf/coZoGVVR7Iifj8UPlWae1R4ZkJ7xjrDGuIJk3px
         df6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        fh=P3LIa1Eq8afvLbWGTasf4xz3mgC3dbiZon21+nKtXfY=;
        b=ilqG2V8AJJmGxqguwZjThiYP9Nz2E92MNuNZjWxKIPnhch9Zd9C9I77BqPqCPzN0bX
         8W+2hvKABWKLvDthUpVgmvHSbJPATbZUO4UlboLKsHjbXrwHxihxIXU1cUy1ub+OsWao
         5NMp7RzY8pu1/Lmbeu32kv8d3xYOnkfgOPL+rDZqt5hhAJX7A/n7w09X6xgVimnJU8gP
         OFk2z0GjiX1nSWK+jLTQvPyDd7BxzR4FyzcmBL3um4569lm2zzIOAZhAnLtHjyz6iq3/
         t3DzcR0RCbxpx5kfOQSTrh6yYx/ao9NSQcEqGQN62CHbHQSI8vvSs8JVGao0zP3811Fr
         ob2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778306; x=1782383106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=JrO5TUntxG44+akEv+ys39/1vOLyjc/hJRYPeYu35hkT/Q1x4ewokDZyrQ7WFYFYHX
         pvR++tOqATJM8FKDZTRB5JXXbIcQxprX4ZSJ4SPoaS7uCuL1Ludh6MkIgWXsQdn3cx1s
         17wkY3V+pjqTK42of1TriBl81hMF3gwiA926SekONyVeuiwbW0X+zjeElG3ikVYbDsL9
         t3JY6CE6FOxGama3M0Af7E8Xfg7AjU+JxVP6QfCSV6+4u6AJUerHGLIRHt3VC/Vl9QmI
         yt57Jd8oiPK4ztigwFE+/ZXLCfISesdPS8tKaeT7g98kG1HNrqN67MvkBT1cqO8I5+rL
         UWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778306; x=1782383106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=WhBIaTGdKRqjRLyDYuGhnUjArz6NfYBoo/8FZyb5XywXth6j8Pd1cd5SSWIahJsOd/
         OtoMRfTpiUDfAiNx65aM7Df/F2ukR70ZWQnFIacL5stWxHSpXfnOSsKQl8oMoQf9uZBu
         ntd0pBvbKzWJoHoznGPFCSNFxcddJJBWbfXe7Sd1LOHO4eGm+dxxxC5tLlPKlxBe2Irn
         YTzgGLxCnthqzl/tOKy3jruB7skGkAisU3otsqI461R4JDRBVbExnWRlG388njpQ9TXZ
         dU8Xh4EEGZoAwRU1GGWvRFUkbIpLwysdclLMnJf6VXvjgbVGbfwyDmGJlBXQ1ZgxQHvh
         Zotw==
X-Forwarded-Encrypted: i=1; AFNElJ9QHlp4+CF1xaWVT7U2kikHijPVTX3e+1vKacY6S4S1mEXtyZVemcs10kDnG/67+5gLSldsM+E1rNxCqqWKpTlwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJeCgJG2zgQozxqZLFZItzyUE+r/60z+lFVLyFZkHZnu3imC4W
	J6nO28M3aq910x0UHbHYVXhAiI9wuUk3/U9rOL2i5+UjnIVPF9lmaSYckocPO6YA/sr13apHEc+
	bfEd6im3Igo+JIRRw+S2zfka0z6upcUM=
X-Gm-Gg: AfdE7cm1UMi1ADgSJc0BM2LG10nxtzJQZRnkL3YQdDDuJL8sz7E60MaSMTvP+hQ9mzn
	vl/He1lE2LRHYcVa51Q91Xv9NrK4I9hzIJFYR17z0vvLT1hALOfnJQ7LAkHzGSLU1iAjwQKjEtk
	8rocwfsYSbssR2CwZAbvxBZ0PGSbukwfyCv1c0lFjrVUfPk085ThI6Ys+JhX/+N1rTIwEsIuSIj
	XHmxkMcnm0FVawthNw7AKBQ/t1K+mK1vFBYrcWFk6DMKCpnDGe+eprpZta62guZGUnbBHotb5/+
	PXUHYiGyxQvplYkKA4USraHEC8bN3V6ub5gqgP5NQX1jX0/lpcRTg+DowvTcvxs/9w63dUIhimv
	clVYzOtxVlyJb6l4=
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-49234141d98mr81843365e9.33.1781778306310; Thu, 18 Jun 2026
 03:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJwqDt2jUfhSD1x@shikoro>
In-Reply-To: <ajJwqDt2jUfhSD1x@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:24:39 +0100
X-Gm-Features: AVVi8CeKp76ZYhBRPcDvdhbfVkObzMomSw3gP3ldqFUf5h9HH7P4rMMrIdx25Ww
Message-ID: <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jun 17, 2026 at 11:02=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Add system-wide power management support along with wakeup capability t=
o
> > the rtc-rzn1 driver.
>
> Do you have an actual use case for the wakeup functionality? If it is so
> limited, then we should maybe not support the weak abilities until
> someone has a real use case? For which then, a proper solution has been
> developed and tested?
>
For running s2idle cases with rtcwake > 60sec this feature would be
helpful. What do you think?

Cheers,
Prabhakar
