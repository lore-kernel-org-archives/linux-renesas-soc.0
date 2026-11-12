Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509333;
	b=yrW5k1jlKWK282qRz2d+7cwZ9k5YRjirg9kqzOmrJ3Diiyrz/Z2HyFGh1G5uU2GaEZ6u
	 XRu5H0V68/yr6obTcNTuuUCs9QkvtjOlNwzPv6dvvYk8KzsuTQ82Ybxb+3crr93oxhXDy
	 DlEJaUHR8bwIt5cEAZ3pHep7/OMQ+W26n+sJLt7jk8QxaGFtzFpPNh+yL3LPFWF9W3av8
	 z6pepPjjkCXUtD2T8pRGxmV7TF+gmRW5ueVOF+PfsQtyN2a70itJTV1VE7QYQvQdU/TvT
	 kBJFiqxHYv/oZ7a7MDXq508obVyWyYxOrCz5cu/d5Z0DDXfvhMkam2gqtO++odwJrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
	b=lN5eHT7tWhZ0NMEuBtsWWj8PfKwI21r+11QsX6SKUg+DKC+5aqPwq6tFVoMNuPNA7Ifw
	 zdAr4y44piGh7mMO/FnHiyu+MHcIaCC0sJew5U6Bhl9+BagB8utfhq+23pmfklt7Umot4
	 AKleh2tE4XqytgGF5MuI03ZXzd3gwHfCHM6yrI93rbH8Fg2JYSlzb9iwyo9d4I/2GRoPC
	 ldO3LeVhsVf081larTAuqCgVHuWJrqOgWNtDoaRVuYdW2wFWLu7DBFMS8ItJbn2ERhE9n
	 lOmS87R9ixWj0PQ0dBhEQ0BZXeyrdr04/RJEA9MDONbw95v5mia8m5F6hM/1fc7q/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Uwp7LFy;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D366606A31C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D366606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Uwp7LFy
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so43033f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509332; x=1795114132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
        b=0Uwp7LFy9H3iZbBdJ54W+9fgzSqkyHsStffVINr0TBShOrFhc7h8UEdYxpjnWd1AqS
         5+gNE+B5sxz5Zt8TCiXM9hd1tuKEQOYAHzWLw7hFAxsH7xCWosBsl2EYtj55IzP9APC9
         Bxpm4YKHBidjtg+XklPtQE8WS8GB4dplrA69fuqhw2V0WPsxA90TMNheJyU/MjdrS6gA
         wgNSiOfJ8qallXm+3EukTreqjh/4+MOL8/4p7+lCY8QiCkuWP2g0Ikb8R1sFrYWKgKph
         qZQ4xiEJXR+aLghKiBo7hefVt6t6+lqYoiWpTbFb0RrYyvE2N/6nTSVYuc2p20PsarDl
         OKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509332; x=1795114132;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
        b=vLqXjmpK/YHmxJKoy7cyfS38Enz70yPaNqS/xvCZzUM0C7mQNcH/m5LQAQoBphNYqO
         tkDAPv736ArHERQPptLsmrnt7Jpg02M8VcpQWZoAN3gWjWaYQcE4JNn0S0Ndwn3+qrjk
         VbPxa+UW4zzk7SVxgf6imynr/NWmaE5L3bcytAZGY/hUCqnKY156A2EKnnPy8gAdukFa
         rkkq/l378pLK+PODP21rXGvb5gyPu7aeC7WJYpjZbcLoHSieruKh40udeZqKK27AacS8
         bpvCJz+cL++Y4PV2EF1a/9I1SVUb5EfkVGc9AKs6YXobBUK92VLbIa+TUWVOQ7lV7h6/
         ql/Q==
X-Gm-Message-State: APuU4Z8PgqqnNBvjRNXBvIOQrcRqGBbq/nXBWlYdNs8aNIYQ0hNI462P
	UFc9djhVALfTqIOtda0iUite31tSx4qcwglLNQMRVoLGgOajhimFQcm3
X-Gm-Gg: AYBFou2c/Whhhxdbb91n5I0iDo7pJQoc40Q2Tdv99iIH89F2uZsWuKkJKYd/Lwe6IYD
	0IgDMBy9NpbYMjtK/flSi0pwgzSzN9knMzH3wbXfqEtyA4HQpURDNohrd8iYfAPoNzkdYsXXJWS
	YgfVrarHESikOcj9iP6UpAAlfNrjo+xY8CoSMzXnu3CYroudzLsehU0GFTU4rQ8HJu6Vcvfwdn6
	hLtdZzLw7RAval2qilc6tMsIEnc6Adt46ppyVERzd6l7rFwa/xrGRGY2TGULND8nTuVt5BeRUgT
	cdFetkqZV3fUyLZQsIrI2yKyBYUJybxbHQSVrC0CpArekYSbl0DuijR7ZcOsnih7H9l5sQwmkjY
	l0/epjqYacLCuSy63d0oS7O0NJew6BozxfpIIv7OePJMsvwN9HFT9r0AluYeZZDVjDTUrv3/inn
	kJ3bQFogVEcKm3P1vPKy4Y+9ournIRwlpr77DjGOHSUJL7sfF1z3v09VHd6crIXcjl1dsvmIefS
	xRRq0E+CuXIUAW1KHbSphItrUwJ4s76RdSsZlLRW39tABpvZ3xJCLJIvqem9+cTHWxfnGFmXZQf
	UnPGMlTd2Guxdte9NG7stXYJVr0b4fzokLwk6uVDJWYweMoz1wgYA46CEq5GV8VWJQ==
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr559149f8f.43.1794509331619;
        Thu, 12 Nov 2026 10:48:51 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:51 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Enable RZ/G3L SDHI
Date: Thu, 12 Nov 2026 18:48:49 +0000
Message-Id: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIABEK9moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3eKUjMz4oqp04xzdVINk85SkNPPktJQUJaCGgqLUtMwKsGHRsbW
 1AK8wX5pcAAAA
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509330; l=927;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Dss9d3rLSskDoDGjHbVLdNl2abzsD0tiK74OykusZ0g=;
 b=U5lTnM6vZZ2+5AixWA6rJ6+Y3nnciUxHLKYa+1CLUz+FfMARiYHqhiMyLwt3GjdSOAUI4Uioc
 NAVTQK3dmPXAAoWx3xXdKSBWWoc/Gh4YdGfSTTBlRh8+PCKbgrCeYj3
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  89 ++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 392 insertions(+), 1 deletion(-)
---
base-commit: e7d07f2ed4b4a14f79bc9fb417d25695cb7679a9
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

