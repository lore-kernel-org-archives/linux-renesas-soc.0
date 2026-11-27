Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809787;
	b=QAAvHjsGVRuyoC73+2ELPfUFhhRtruynpxFvV8deu/IJfXnkL38Q65RFbVNtXjWcGHK/
	 lT2oewAlI8DpoEfw2oCWqWxHaAnTpJzi0GnWej5vCPTekvI0SNWMmIpk2TE/mnJ/hTbnA
	 kDAPWdOgw6Ydo5uyTGxycT6FRLexLg2MmzisW6rAujdOEgiNiBx8ZHGt0FkTMx/dZvi6k
	 aMKuGPr+ZI/CQOydYl5dW6CLpEPKhQyb3R63r3vMjwZdzRoeOfNQc06nfvndRJ6DouPIb
	 fn7PqGhJi16+60dHEE+Mz8rPvDQO5vOcLWYGEUrzqvGcO6yV7nNX/MQwXEm9pcFN7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
	b=lUZwBMPDoPmwKW16jVV6/N/QUcy8WRgx34rO+E22yFIeIhQUaPwgmSFBiDx0wvVRabAw
	 /rfN/1gFAdhh1c9yfn+FgHg0hGiEhvezwqgvGcC+lpkK8jwUFiEsgrOENwlvgnQxdQnkh
	 94/RP5/C6z8+5EA44+x9sPo3Z4m+0iJo1rpqp7hlJkCP5jype00ZTfKHlG9EbPaq9DwNN
	 ClwLfcUpB8M6K4zZSBsXV21hLFLX08lvASk3l5+D1CeqddTje6Mdu5cIxXGkmn0yuT2NN
	 BONlarxK2KX2VT93KSBucdgMT56r5b6csoRREYS01g0hEPYLGSAXvnPcHe1x1gEIjOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=USVugUGJ;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCB606A321
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=USVugUGJ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so9959516a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809785; x=1796414585; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=USVugUGJ0OGFei1oWOv3ixK8kXmdxW89ohPqYbYPFavNwb4jr4xK/cCB4y9hnjKBRM
         aMOvkgqxflag6ZhfKgZn6Crc/Q0pKn6tBIJr46jAuxAaLmM6loQMdtPdlzh1ApFcCcIo
         B9aE8+dPxpxuHlLdrD194YCNFEvbZV3F+cl0P53tTPOcbIF6UF8cTL4S14CNVv4DUmuA
         AEgFaEREQj2bq+B/IQqtj2BIkyBdW4uRS3Y7P0eYNo5+b5iJKu53Sp17WIb/C/drqg3q
         +O8oCjm7LKaIgd6H5wW5LXl6/Pd9/2GoHH9kdvrEAwaYwOXV+667Uk+wJ1cWl86UfOSi
         Xo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809785; x=1796414585;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=HoeqzS8hdmP34kefMziDtiXE+RCLwYFxEGEdq8uisedkI7kyH4GH4L3j+01EaldYO4
         Z71TCqIVwJSNyUoRZyl0cxE/vqkb8Duz5i8FdMZg661WNrM8yjYVJPCo/WLKGO7n97t8
         XcZrbsGv3skSGHXwwrRIBklFmU9ZkqTVOZrfF1TPkB/cbCFBtMJ4EWW3/yWA6n3xBt+x
         qipK2k+dFQ2elHrNWVqbsxha15KpvJhRbXoLOiOP1rlutLft4/FvYdwtYY/JP9myfp9c
         6itpsTURcVNPr4c+7Uh5NtBKs+4pNzbyt6U9gAX5/zfopomd4xoTsux6L4KAn+dG8VaL
         C1Rg==
X-Forwarded-Encrypted: i=1; AL+hErG0OqAypOFn3HDjuZhm2p/dWRTLezSjJrqA5uX0MlchvmLO5/+12Un+0wEb9jOrVLpk+21Rmef5ZryKgJ32FuQZcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D6rnaSt9rIlP9OShTuaw1VsLRu4KA8q3n428VwjhN6C9kt/Wr
	FHs5xhpKhMNf0QdHjCUk9imsD8TdNyV+cIbV0Q/ZvY9CmoOkvY5oDJI0Y9ZrbLx0kQw=
X-Gm-Gg: AZFdTZd+HnrKHrVaLGqZkFZh9RLYuuu27H9/l6u1InU9z3aYo7xGBsVejMwyPxov97T
	eem3t8lLp146vLm6iSD17PaLejbQU17CsfO62gb32CpA40bN+IFBVBDAlhIOJkG0kmrs6ypBRcR
	04P507I96S9I2ei5N0cFZHvb0Wugian6sWgLPvVSpiPs+5CPLehOcYtzLzI0CKqCy3yDnOLrow0
	EvV8qnFUYzXLNS/Hdzf2sH0yihIhEFFpgVtSX8Y6oaaeJbOgF6PvxdmxXbk4SxXcxyR9Bc/UgP1
	UM7H4K+uFj1BDBoWmIdKh7QNHhCxmqHm3CBjwH5h6UaehRMfxy5Cuwa/ONVeA6MxPbp8HY5RMGs
	TwJnaKcFp5U/c4H1vsNfTDBNEZnjA/hYjTC8mHTRUMX3C2apyzOi4NMaV96IFhiurUDJBLLp8/E
	knyYCfccZX0VKz5QtvQ/hxhq09MY30uT/MieZeEf8Gv+8LMcH3pdBlI2/fZZ+ph1uDyHm6rOVZL
	9x5gIdmuZGOyD9nZfbonhIVKX01cKlVv+o53ywtm4ZqNfZi7Qnf2fsJXJf8D/PSubcPOAvi/Phi
	l5x5oIiB2B4cSYdJRghv9Lq3C85fOdKq5LniZzRK4pPCON2R
X-Received: by 2002:aa7:d402:0:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6ba1fae103fmr14763271a12.3.1795809784883;
        Fri, 27 Nov 2026 12:03:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm9906969a12.37.2026.11.27.12.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:03 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977968.3028968.220600254133838233.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=438; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1x7I9OxtWjxbS+wEVDFGimHZA2zKBIWqfRJtzMCbXkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD7/5dtokM+ZkaTF6K2ZGVttk1rMrH2fK8un5tvb9D
 fstDRc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJH4Q4wMmxfdaay4eymZS6GK
 Z55007ypBev3ur2PCN636eTcxxoMGYwMv2pstwfXV9w7/0GsKypkd/dKC/bAd4cr1ViY1xxhVqj
 nAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 19 Nov 2026 14:40:34 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> about consumer devices").
> 
> This commit added a struct device pointer member to struct clk and a
> parameter to clk_hw_create_clk(), but the new member was never used
> beyond setting.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

