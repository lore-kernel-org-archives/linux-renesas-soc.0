Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650B3AC00
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580804; cv=none; b=Myu8LPPJqz8xegDWbP/CmPmz6GxnftWDujjo3bKJWrjLwotSqPT28eNHg/Q6F6BLkEIsQdnbA1sZUtslFHZEIgVF98ZW5QCNL8lR+tFG4QCKAen3d+m2bjmiwXJXseoze8u+frcJ7RTCyjInNTGNE3zUG3jhgBVyHCLuej6q67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580804; c=relaxed/simple;
	bh=fSrbO0X+3ySxw+b6KUMTuqz9PDm326zDCh5hV4ahPOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvvK8GEJryDZfQlEypY8qwSc/yGGnygd1snSdH87JcqLeNuCvmeC09Ou9fVd3Uy4O6amqCWwlXKJB+qlVRxnY+E2kNe+X20ESvye+r552PG6ma/XrVtwC6I5/Z7R8ZiGjJorWwDf3qzjmleFIQrqXCNx+b+GjRP09t21WZC0/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZEi65Fq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZEi65Fq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48379a42f76so51349235e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 15:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580802; x=1773185602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNINmK1HzY8W2WXeM6TACfCUfupHIfdDHCepQJ9ZJr4=;
        b=BZEi65FqHXFD+Fne5xRdiQxyQAVkhj/rGygxRtX7GhS0mWggict3bKIbAa7PK9SXWT
         pd9i40sfEdMeMkq5NxRFO8+t9Shfk1hIt9LGasip+XXAn7pcRXsUlsuJ+fY1pQuY9mXq
         oscF0xxg6nh2NFfW/zAhoFwGxn8fQB/0wd6OBbp/7N0NOwsyRChREeeChfLIf9iPFSzr
         ZpDaFD9r6UeTHyVLWXPhZMSqClDFNeCmj2e5Vkrkp9/5Jp+TH+TEUNVLQkjLyfvnDbDK
         EYFyQh9NY9/tJAKhScVpFo91XF0jD9DWOad2JdxVq8813ZfFxRYOgVR7UCc0URd0Z6Y9
         cV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580802; x=1773185602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNINmK1HzY8W2WXeM6TACfCUfupHIfdDHCepQJ9ZJr4=;
        b=Po2JCiVrR9tByMLjxVrPhetdKiq6MwGPk2wtCNXQ0UN9gr6jMAmnCdr0GbbPW1M0za
         ranMhVfzyNUCZqNyn41Lba5u1WRE+JsV8LCiKnhhYAekSWakg/AfvaaZiFSqBypNVEaj
         zJEQK0zeh3Q6U2UUdea6fHhs7i2UwJylGiypA9Od23Gwd4WrW1p/JvKwnOl9FjOvGgJT
         NxNk54rQxjVtx2sRnZYfPMaaIPqZfUEPu/K3CtSygyA1zZoVQt5lAn6hf0kJB64VfMOH
         ZcRlJgbmPcBmqN5dBQ/acRx39CrX0y56V9v/GAIWqIuH4cVRLwagWRI7geP/JDusIAvb
         5eDQ==
X-Gm-Message-State: AOJu0YxWgcBwCxjxIvnDIeCM3Kdx03NDegR8pSyAHRXuadukYYxVXMv0
	fLBGnjjGD/p5jNUypVwREh91KkXrZLOB7ORb25XNb678pBojl/sy6lH7
X-Gm-Gg: ATEYQzxFN+jJLCk4ifQcQ1UfBAGmZ6MdpfBXVy1VgTmvEuU6osqRZ1xtwdBdA/7kZmn
	h6YSxHwTBz1V89U1H2Z7zM6OyZijUOboBJeYGojMxXy0hV7cd+jn8ktc9avxrS6jv9n1oWBeOQk
	J5MhYtz8J51oN2E+klOYDYjDK/tuKFdgiFCuVWTPmvYrewyRZS2Pl+nlfCuEut2OiBQQnV+zYYt
	ofMjxuFIzfrlv7HWH6a227q7I/Zh1se1tRLMMQXy+j+taxqiufN1RLhjXXAwcYBliMYZJo1DO5d
	g1DjhJHrhcRp5rWgMzPeL51cd+olJ9Kyh1VJ4cWOw+FOWU8tjNRZL9EH3B6j+E/akqyMcay87wz
	2Q8hZk75ldcfCTFo8oAOfskUmDlTaZIZqC34qtTabfH4uJb+I+zug4iHh2H7odC55xl43NJ9nW2
	2nyRQCOEsd/l9h3fUcQ/Bt8B73RGUaeuLmqXM+Og8qf3ZccktArHEp8sYxmENB0XqwTz6c4ZTNa
	Y4d6IRMCea/KzEy7esxmLtNEFTBF9pkJzqHyg==
X-Received: by 2002:a05:600c:6291:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-48519837bbdmr1012905e9.6.1772580801762;
        Tue, 03 Mar 2026 15:33:21 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:30fa:3523:429c:2894])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126705e5sm26188185e9.5.2026.03.03.15.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:33:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add DMA support for RSPI channels in RZ/V2H(P) and RZ/V2N SoCs
Date: Tue,  3 Mar 2026 23:33:12 +0000
Message-ID: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DMA support for RSPI channels in Renesas RZ/V2H(P)
and RZ/V2N SoCs.

v1->v2:
- Added all the possible DMA channels

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
  arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.53.0

