Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA03CB57D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857066; cv=none; b=otabrJ5AwBlEQ48EVfzXpYsaSgZmT23cyTah0yaFCeF6EZyaVOFqiHrpRoqXv4yAuM1NKLeZ7w+UkKXoLgfFfWWxGrHk39wrutB8Bd9Hv8bJwT7UbkeO/wRe1PrH5IpqBgrVgcLGM04rozuIoA+7eq8D5eFXDLsbghUJT/h2loM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857066; c=relaxed/simple;
	bh=QeUfwmPFisGgEcaqkK4QXIM7RLtOZ+2jGfU6f8lmOwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cnoYLxgXGfLjpzUs78Gm4YcsuvPuYDVAyFzdBHJksq0aTEwV6NJaALCVBAIf0iXSI3kRaJzBut+Bu660bMdnxJKOsdmaexZGDM7Q/9/qji1WHombTGrhPmozUeI4ryWPH/BhO1/FX2LwguP9eK+RLjCyZRavlPsp82DHzdSIiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oV1Ig7oR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oV1Ig7oR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5682029b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857064; x=1786461864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A4CE+0Ei35NseJ0byCDc5G+3dRXiUaVlVqIokKqyYps=;
        b=oV1Ig7oR8lnWJ9nDtyLwPrS9wNCZXhm9RtUaf/HBjwH5pjm9equ/zbIVflxK3yJE0N
         3mapLT7ReWYYxlXiJJ0mVKZ1V8xTr3Z6gFwIJUiplPbgAs2zrVAfLGtWVHXMwaG37WRi
         ygyXpIq/LeQzbbh49lOhkWXIEayEK0PLftg3c12jNvpKWIuoTZPmzrTOdUu34x1j3o1Y
         8nbPuc9f1au54vEquze7dfLHEaz2iY5tQVfIEiYDcah93Vy+I5gAw8gleUpfQwrkKwMb
         5EEOHk8zmd/9CQNoa5bBFRa1as9Tu8stJU3P1Q0Q10lUXkgrlQQJnkZnDHmICLyrL9sH
         Bh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857064; x=1786461864;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A4CE+0Ei35NseJ0byCDc5G+3dRXiUaVlVqIokKqyYps=;
        b=bWeuib8IjvfPU/frgrsjbLJcU18GtVu3XNdeavFLgmIuWNleeVwcjh1tY8MIR8FJCU
         9VIv6bU/bpy+cKFBjZaZjfM1j4FreIhb757qOymqJSGZyfQ6cRQM8bl3LWebSQVlFTYL
         5DqLB+6CLppLNxeJx/6Q4OIscWxOyBldyglmOP4abjexo+kFi1jafrQBgMvaaMCQ/djv
         ZHrmTz9E8BimjbgWTq+/5V9YizaAVxZ6Ndk1XjaUUBKMObwxFMUPHn5BQhHPmbFGRoWz
         4kiWMndnk+50PSnwe+RevSYD3Xw/hRSxIgvKQgG0FuUal6oycNRjkE2WvokXJpDLWNsg
         Rr8w==
X-Forwarded-Encrypted: i=1; AHgh+RrO3Vi3Cbl6enpimzePlycUQRt9Nbg4T7j/dmvtKAyhJYXIj2/KnOzbfBnDuy4JH7KMHuohUEis/hZMj9Qd+nYslg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Sk0QWGchjryl2WVpD2HaxAShFAVMZtBJlMK6NGXTzpxOlXfa
	CwbSDDpHDmTRktWaI5lmzMN7MQFaoHmnh30BiWFVWsJJONlcLSSQ2Zso
X-Gm-Gg: AR+sD11wgZXLh175hf3cOFwwaK4+CJmjNV+fLcZ50gSgI/KXhFPkCsySoQXhd6AWm8a
	loNWaNfZjvXEFHTI1n71iJLb9fkEPvq6raTw75jkVoElsbWcUIoXa3bDa/dE+sDrJr3c4X3a4wm
	DXc/JkBUV545b2v8mEc2nD+nYte+T+WI1J64wNjRyRYb4+Dy6wF0kT4I0aaVfjPwRP0A8dTh+7P
	PBpVVdVALdiOPWVoV06XaGHDgHA1V0d3oSWTJxfdF3DsX9oEnpu/bINzAMvX897XIs4Ql+UOeBB
	9Ejqpyc3LGq9FOxkVms4Xdlq1OuJUQNRD9Z/BllIutaOvg0S+qbvM8oN4l02htnBcDcDBr/7/Ai
	VG7eYKSCMX+hCz3ROA+YoCo9oVsYcOs6RsVlDwOoxYrPAbMoTmd+hMrjlivuFQ9r5XN2fcoIBr9
	e5xCWiosqvtGl26veap8pWwpvCkTpH0gqyuqMlAmn6VIroQl8Onripibc8SbK33nWmvLAr1qjYY
	Q/ePUJzYnKGHbEiAHb4o9xh8w0uO5RZJuUryA==
X-Received: by 2002:aa7:88c2:0:b0:848:60d5:9526 with SMTP id d2e1a72fcca58-84ee489a429mr12656420b3a.43.1785857064238;
        Tue, 04 Aug 2026 08:24:24 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm5586778b3a.14.2026.08.04.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:24:23 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/3] phy: renesas: rcar-gen2: three cleanups
Date: Tue, 04 Aug 2026 23:24:16 +0800
Message-Id: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAEcmoC/22NSw6CMBQAr0Le2pr+BGTlPQyL2j7gGQHTYqMhv
 bsFty4nmcysENATBmiKFTxGCjRPGeShADuYqUdGLjNILktec8W8NZ71OEkmNO+40NapWkP2nx4
 7eu+ta/vj8Lrd0S5bYDMGCsvsP/ssis37142CCXY2Rp2sKl3lqks/Gnoc7TxCm1L6AiBG75W0A
 AAA
X-Change-ID: 20260803-rcar-gen2-140f014cd384
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785857060; l=1287;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=QeUfwmPFisGgEcaqkK4QXIM7RLtOZ+2jGfU6f8lmOwQ=;
 b=slXwm7nOmlEjrB8NV6wNLOHCgZIBl6R6ANzhFgTjUA6ZY+LNutefmrFEWTeeOAKbm9zmQ8Xnz
 x+x747Z5FjxD+Bp3TMD3zf2mDYDxHTX3pkdBt/e/l8YOWfS9QCGME1L
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Merge patch 1 and patch 2 into one series.
- Collect Krzysztof's reviewed-by for patch 1.
- Add patch 3 to use dev_err_probe() in probe function.
- Link to v1: https://patch.msgid.link/20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Felix Gu (3):
      phy: renesas: rcar-gen2: Fix double of_node_put on phy creation failure
      phy: renesas: rcar-gen2: Return -EINVAL for out-of-range channel reg
      phy: renesas: rcar-gen2: Use dev_err_probe() in probe

 drivers/phy/renesas/phy-rcar-gen2.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-rcar-gen2-140f014cd384

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

