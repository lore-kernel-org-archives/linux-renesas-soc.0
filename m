Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224493;
	b=ypu2RAira04CIfV0kpPf2bOZGRxko7IeHcEFCAfNvuClnHpmuzJvPr2ERF+dbBVDFH2C
	 b34MPrDqzCntkaLuzKC2l0A4vjiepHj7QkfSMsxAqxw4UF5ixF7/JqZTk6OWUNWvuqEy1
	 y/wTE+eaOhh3H8M/3J+WTfefYmk3XTzdly34/C7vl+cVNuTUXzxr4cgQ6HE0mxgtfuwMn
	 4RKbKI+lCf6Cjcq7JA8LUrWFX/yE0UDoqWZUdel1bKym/EKGNhj8Y0mRLKB7J+k8oU15F
	 Bs8/gCFpTEbeoQPmxkpbSjpTv5pIxQJsBcQOrvZgKHDXOlv1yYTjvbaPVrt4PInaBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
	b=unyHFNCI4dV6Y1zgUjR7VF4uL1fdLeFM3XHSCCESV7VTcWydl1xYHPF2cZrWXHQspjxu
	 LZlnJcT/UAcnQoT0LC/WD1i15dAM6KBukxY5UQG9Q3cxICpvPv9+V50a6sp9ZzOMtrGjw
	 2BjkkbAtSmAa6FB7MroTYtlJYgCYiXR8F5mQBAqBblJ0IJpvCUs8KlSUS6NjsHYbLNJV3
	 zlZAQeMMUsXQDoMIPYFrAOPOxftGBPEUqiuIF2EjE5d9RXGEAAdBvpDQcMj7S2XpdnupF
	 12KLDJdRcNt0xIGKy0lPA8LgFcSsgy3DfbS0kyAyruoZwQPW09tTciyMfGPj7xDf13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUEBbK25;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777F606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 11:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D777F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUEBbK25
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso463374f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 03:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224491; x=1794829291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
        b=sUEBbK25IWD87H2Jagc9xT5zvdmVKXmCE5On3B6CiGg3+gBdCX3V68KdpSbT3qGfbS
         LggvWXJ7y82Jk0Vci0iSIXy9u4cXoGodgJ2CHJvHCrbzV++WPyiJ4Z0cY2AR/gvJUce7
         lVua9nw8S9/nlUnzRSKs+p6VgMhNiw3pwQgCg2vEReX9h9j6xuOebkZEfZELpQ6KL3JW
         SlmxaeIAQGhaNM2zMttGRytgYNbkvB1hEa8WWB58jqD/nTYPbWNhylfxLDmdg4YSdV91
         JFeO3713xLF6Vk1jQdEqkAJLsdjbF84LVkCJ92CsgDZwKBrR0BIya0fszXVHQKkIkeqi
         kLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224491; x=1794829291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
        b=becfwHpobRUEq7VK8FUxeaxfKa2HpeeC7Goq6g6Z1GUeK/jjqd1/Z3mgaDPElsUtS6
         4cL78j1D1uwy6feH6RDIicqWUor5mA8RM3vBeGzUqAZGoz6ngaI5+R/AbSS6tsDJg6IG
         EZIqMaHRdqMWGTNAqEX0EUuODoFMGxSUX5ZHzgu/TGdUgzP/uMyJcPRChy+iulEx8349
         g4P1oL0fk+TE7q3wmNHi1sIiFXKCJEF2q6RxbOpDazkvlgBlWUAxhe16UV0urHS/JsO1
         ekLzrU14SMA1m7ccqEFU3RIV2s/5GzsMMaZQetezMBRxb05Hvl0+5IzZqtBYSzCM5XRl
         +Hhg==
X-Forwarded-Encrypted: i=1; AL+hErH/aLzNtp7u2rU92E6e+gQIanGbY8VP/OdUSu2bNwR3n1t4EIq9AC2OoGYA/nJGMvp9ZkOVhY1KnzwPyURXOz9F7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VMDItY2DQDBE1P3gJ2C7MEdA3BW2ZW3HllOtJyyGV4TXaq+Cl
	bKwq9n7cbfznx6xAkIEy9E+3RTickB52VaIpfLoZ/U2Wg3vIhmeW4c65
X-Gm-Gg: AYBFou1UAJLMO32sWbu6w+YRcTN5F1qV2LeB5oKCSj8bxkMf48UK4QIqFcN5Bp2rRBY
	2aSb3NjRD+5aZy9LVP/ux+ff5D3a7H/z0TRoa/A6Vbha+gfB4DhiicV7JhPjYlVwW5fJ/iIUqDL
	+5qw0VaTfZw3J3O39OdJKp0KbZGcY4Zys2kEjpQ/cZPNpjNgnMwuziPscQlOmKmj5twWoOR4CWA
	3E4qRtgzNlK72N29ocZs06MIWGdloVHywgSxZ/3Q2+1kbyzPbgSSwZG55PSBr2BHQBPoxk/uGH3
	oq3dyhsAqKRhBTgY1AqSddiis93dKjV4NfEmGVm1419CrkBT1/kddQwUJBP+XL7aAZdtHR6EvT7
	DUXmQgeh+1puEkAZ+5LdInK295f0QvIJ1zuYX72yqKXmTz3GRDxjqFX07xVX8rbd8Bb1Wq15KYQ
	IfqKicJHP7SHF8/xOgE96kzkStK3Tb0FFWSfEcC6t/JecxHSfvDYkREQnRjJ5RXi1CvbW6S355D
	Jj+VrWIftwEGYhOeCdvVW4jsCrgb5p3PYEW24B1lIfEmhaD80L0SAnYNufSQeOi2PD8pbSaMlyZ
	AvH//b9N20ERHnpzRHJkPWzIPFfvlmE9nVNmDcZsKGznUqRUMjqUJ86SeftDFtA8iRraj7xaEhu
	O4HUY5jRXyLI/G1wsOAGjqFEom+TAr41m3o6t18RYKeAE5f04Fvtex75e+hConOheOboIrU2DNa
	XFKrQQJm10DQcXBclKAek=
X-Received: by 2002:a5d:6f0e:0:b0:48f:d3ba:7314 with SMTP id ffacd0b85a97d-495843aebc0mr6470230f8f.21.1794224491086;
        Mon, 09 Nov 2026 03:41:31 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c121:a50c:ebbf:3e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597d09e20sm9525626f8f.54.2026.11.09.03.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:41:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
Date: Mon,  9 Nov 2026 11:41:23 +0000
Message-ID: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the RZN1 RTC driver as a module. It is used by the Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..a5c4fe0ca5f9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_RTC_DRV_MACSMC=m
 CONFIG_RTC_DRV_S32G=m
+CONFIG_RTC_DRV_RZN1=m
 CONFIG_DMADEVICES=y
 CONFIG_APPLE_ADMAC=m
 CONFIG_DMA_BCM2835=y
-- 
2.56.0

