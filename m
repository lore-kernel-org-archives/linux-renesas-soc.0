Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450780;
	b=U76iMGIRuh2mAHSvL3TmKbsL9MlL0ZMl63UOOW4e0/6lWpa/fXcKl0qG5+kU4sjN8w0x
	 8KU30PU80GHxjG8p0YxIk28KUvt7Hf615vIS0enkl434RTlJfD79KfY67X/neM2RbMfxS
	 VxhTCvJIHcB+iYqxtYqrXHx5cIJi6f1xySYWm/amSBBr0htZSQnoRb45opNGCCzGiObqE
	 FB8h9oxkMJdvcNIOJp1V5Z/pX58l14qQMYFLsq7ZkZCRrbKbfT0crAW4CPPgxmK45T8e9
	 Hou4FyWHP55Gkf4XemdeghrLHJbHMA2jXMAj8ikX7Oy78mOH33ZR1f/d9IgWf95aK7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
	b=aVHcZ3qgTi2cjkByGcSsM0FHUt5vXrxzG2ViWcSuHalLl+ggnQkAzFVZ5a7rZFtZPwGD
	 ojRukqRJdsL1A6I3Ad2Gxlg+lzPndDS8XpZn/BnPgmnGFowAIAsGYjk2zXkfW4xppufjv
	 Hqp63Fp8C8TBMwOWdW2fesC5N9/MvNccR79aaAXEsJdYlfntHOClnmn7jlgfvQ+o7qXGD
	 fjdMui1Ow0Nh0keA1/Ma8X7f81gReXKZlEuID0I13kBayr3pTLDB1sDaJDKDNK2I8HCg0
	 14h0bFgVoSThcuMhwtB/qZm9pJw2M9YFE/7fzAK7jBXY08gK6nee7J+n3pCaRgYMwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sf1ye8c0;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48673606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 02:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48673606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sf1ye8c0
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e96502e447so31095905ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 18:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450780; x=1795055580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=sf1ye8c0sYH4D0xHSeFLJxtpIO8jYTtz8n+aCV9WLa2DhH7wECKLKrebKKCVoWtJN1
         XGDXn6GnRtwi0LFCkr5wcuX1LiSqzArhl5OwTuIsjrLsgEvzwPOpsSUmcAve7cyy6RWn
         n7b2ddRE5kWsPfU8zCVrQh4I4H2MYJf+a120kMCM1Q0eNu1zj3kSuJA0MGoEFAbndMfv
         /s1djguR280b44OTKyZ9pxBwsRBlDEey6tRTGXTNXUafQh2jyBFBo/3/YWktc+tZcBDC
         2In3z9t3Y88yQ8U5dBYtfgb4neN+C8mfjmz7hYjnzm4MMpAq8UFO4Y/IAZbhHjdyd+98
         BwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450780; x=1795055580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=u9R4ghPiNsEAOn2s5HClJKIgx0Gmxdz6B7WLdxeCWtai6SF8crIOu7gGfJejDzwxDo
         8J2AjQK8H8d28raDn0QMn+LvuU80rBxqNAPaHBlFJzYY16kf9OR8/W+RpFdy1m4rFD05
         ASxV5Lx2yBPPjYaPGO2F3+z+nqhX6wR/1bb9RPtvgXgo+Pt8JluyWoPJw9j6dJYXAIIL
         n/GgRJreWwypsAaNpC5Q/XuYwT2sEr23k3+oo22+A70L7CjNhoWkpH4FI3q5ZZIc3ThD
         d/UhamF8fiYhikXOE/deet5222viQeVQz4d6lQLcb8Xjo2N79U4MXU2aH9ZO6AJm7rrx
         WRIw==
X-Forwarded-Encrypted: i=1; AL+hErGYeMoFbTR2rvikN9g6mnuyX7X1kmr/SYdY4+idfaDRAaFmuPtrBgrWUQhu9oaQcKB2unSNbFaF2uDzghS+HNrOGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8o6PpjqAtoD5uHmios5zmIhHiMnNwWQTP8pN1N4zZDSmy+M0e7
	YfnsljKBnOL52aGRSgQDK0DJTheSEAUGFAeXncIpKbC3RS0yvelK9Jaj
X-Gm-Gg: AYBFou1k5/4Z065m2/iTvkTmCxWu4zasATS2Ct30HwGTtdpYty7yBbVRyLckCBo/69D
	80ECbhOH6pFGXnTMAhpGhnHh69bM95bLdtRYGloV5xLBqLbsPTMpdVcLA/AutdPaiVWw+NCXHbr
	55msQP+LPa2s/CPIlK4fehCUn/xYyPku3zTjFwRgH9qhGAqxQ6sKKRp1KLnvOpmhL4ScLhWjCAQ
	+J3j7g/Uc+HZmE8RG8JCOJO7KgyckDZQ873aFFv3ecsNxi54+KI46+GTXaWzwIzqZeWo9g8klZH
	knFkpGr21IKPdCQq/38B7RKDkC2d8K2PMCi3MfxzCC7ZeMpFiVK6WHTPcyuC9Lr4wHwZ1fsAYfQ
	40HKjX/dSh9qG4CzDe/j2TbxkcbNxjBKwnCWA2Zxbf6Cxxx9pnO7Equ7pbbA+YN+z7isEZxUU2y
	ela9nBgN5d+9MeEmuoo5dqv7nzicsRwYt9GSr6zh5Yg3+Rz4IK40m9S/jvfV8of1aW3CTXYTwB7
	gCM1KkEgdL7Mdxe0lv9Vei+P3n+aJH03/OKT1N+igHuOtUQGQFcF1FIbggxmjrspULjeCcQB7/T
	TuR1LK7bG2pkyYcG2MD7+IHifYJdUB6k6E8ixu2bgSgscyp+
X-Received: by 2002:a17:903:32c6:b0:2e8:1910:e398 with SMTP id d9443c01a7336-2edd76d5e01mr46318665ad.9.1794450779567;
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb68204d4sm26378855ad.0.2026.11.11.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing DMA
Date: Thu, 12 Nov 2026 10:32:53 +0800
Message-ID: <20261112023253.7607-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avRXf6SJuXxslsbx@ninjato>
References: <20261101063739.89331-1-0xbeac@gmail.com> <avRXf6SJuXxslsbx@ninjato>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Apologies for the handle in the Signed-off-by.  I have resent the patch
with my real name, Yuansheng Yang, in From: and Signed-off-by:.  Only the
author identity changed; the code is identical to the RFC.

Thanks,
Yuansheng Yang
