Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805316;
	b=40oDfKZtP9XIXB3aeOEAW3gLydxu1/jku6IOtbGCVHPmqRv3MeV7UlN5dplLu1FyFUkU
	 7t1uAkaqXYCLosA0C7J+VqTPLy9J0+nq3tssYjurkOa8elMVitALM1n7VjsDHRyV9x0NN
	 58sI2bTN7FF7IuQTFI2sueyokAvDS0hNRKRxZxFFxySQY59R/G8Fq6bH/OIJNbQXs4GxG
	 qrUg1npZ220prKSchPsWsHZkKIenyte6fv9Pf5P7uViGLcDJ/J5BCWqEmngV3eqiDXAqS
	 93Lhtbyv+e4Qt6HbBYt56+g7IME5QK0p02lNqsTxmn1G9L1T1+PPQS4XEBzzpKFidtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
	b=DFbvraE3vImsowrR8BszmWjdb8L0W6sIKpZHY5SgZLs62qriOMLEmPP5yRHickYgdtRE
	 tKXibIqJK+5wHgfOjfisbtaMrVM9Nt7Dl4K/rPJwcq7lOqx41q+zlOEJPd4P2IJmRnEO0
	 jOYzRnBkitg4lCqa22RedbnA2/OB7my22L2sxR//vqBZZ1LKig/hKI4DXw0kcy1r6n3mk
	 4WDBFvd/xOXKCCYwGxdu5YDp7vYW0fzZJ6z0tsP2IYjrksGvj/Q7VDC/9cCxc0oa5boBR
	 caxKLHKqMvAF76X0ZVKCkZfzX3dCorqZB+0ptf4DMF91Hd+ajhQUT6+4FzsXJ+LOBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16D606A32E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 15:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F16D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490a0e72588so272667f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805315; x=1794410115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=Atw0LqGMB/2/XTkOeKqUeHo62urG3bqpCUaO1iiTZqhwAZKM0tCVFLLTFdcigPn3Ni
         hREtpXhXKweCPF3emkM7dRNbA0KypJrTYOOwV81hV63Ej+9uK4IQHVBfSt44WgMRocKD
         YEA/4s4cVoebzCQGw0cy0gSDFGKx8ye5WUKui3y+tXrNTWyG8BRYF2rA9kHRhTQe3HGH
         GQObvpisw8rOBuiUL2l3NNhIgICacb+NbbIDUQzx69RO+EHptQLd2ZLvw7EbMT7Iya0U
         QRqf2mlLif1JqVac3SptEfVasbVwAqdIAuvXXIuYxxzveBpN1/Bl++SF3IGZWtYoNR+Q
         I0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805315; x=1794410115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=DU/rneLZMjFT61lFXf0e3KY15HBFZD4oX5u1HmV29kHH9ceRl6mNjs935XV1PZF3wJ
         LZQZYeS6VxUzpsLY4KcoALVqM8Oi1zDN6YOlxd5Wfcz8p/MxVu3PRoOHLZ5THCkaJHXq
         Sn9OJ5hIBt9QDDoiGDlFNzVRzbjEVp5y4yEmqLVNlutQgnBVpbDyVMx0/w3zuLxCJtiz
         sRe8ejyBP4x/G6+stAJdZp05PWfo6fEdxWwdXOF9JG3egKXVNFOzbu9P+KSwdcEi5Q1R
         oeG8j79TUXeKcUAMQxkkHzwBgZaEsbCXV93Ey0smy4y5YluN/3r5OuMWu83qDRiCcXnW
         GAbA==
X-Gm-Message-State: APuU4Z/mdlNLzmCupeDRfrbvFl7zAjqhxhCwm8CJkgLtkumuo5xyT3U1
	bVmDCmTq9+YLEOfc/J44JpKW3kgMJmuR+KX0tzOr0KJNTNw8YUy0RfuY
X-Gm-Gg: AYBFou1jf7NB7MZ1qKQ5qiDOyQwvOUCrGJvR8181R2f9CPeqWDsdbygU37R6xAFEBM1
	IbSyVKnP0GxvMWbAL2aQjbJdcdww6q0E05KvCNdGWfJHqVH4v8uVO10ZiqCmnTwjLrA4LJdfRIj
	ntwcnxyPb1LbDTMMGrgV+EmNCPPtCvc9CXE+9mDwV4KLxoZdyR4ngibx6IE01JwhQMbwUaI2Qiw
	ncHfb1Z0eGV0NBMNKqbhnrCOKi0DVRjkVwh1TDBSh3JbwzE0MPqFFJi8z8NA7MVGgHtUD1TPPUE
	xP97AF+upNkhkcPmOB9xZ01jn3LqPJQsf0/YetBUJcMBjW9rhnoajDoskB4fqi8N6mGyoPxuRkG
	vNuZRBds512McFCOIPbvDQQb81BvrYVy/18iKXd3WxedJKGZAMid/JDglOY7IZdlimB95hb/rw6
	tdrHSbIkRNJ5g0Iap2YghPzniqTrR3VG4lMPLuXl3Kf/mURQh6uShEa8bUbNShEY6gOU2bs8yg9
	ohp9LotAulGzYcaNKfY8v7ZqKgTbfcdYOw590kbYAeNo7gG63XDtRXt+VQWL+uFxQmV1GMvzXVh
	it5WrzbDk/2yx3rCu7DYIzyNyslRM0atXTx9HRqJhsohc+O5wBWRF8eVGBcBNDr97L+YSCbDiIQ
	2KQfAXsvP/Y8=
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr38318127f8f.51.1793805314720;
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 04 Nov 2026 15:15:09 +0000
Message-Id: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAP1L62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dLipPiiqnTjHF1Ds7RU0+Rki0QLoxQloPqCotS0zAqwWdGxtbU
 AAgjMGVsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=1499;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=gHvgnd4OP4SdT2y42oAvYKf3GElQNiCR0xYw32xnBHg=;
 b=fQ3AQclEY2DOskFDLtq6EMJ3Sd6igp7HqCHLlTD4VC6AgnHTLAqrGCbq47fp9NRymKzapBwcL
 vw7uwp9FLbnCr/Yo/i+vH5DWxy/5BnCLwji8f+bg6KueJ/hg7/fLUfr
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

v8:
 * Moved patches from [1] and [2]
 * Replaced place holders.
 * Updated commit header.
 * Dropped redundant nodes from board dts as it is defined in common
   board dtsi
 * Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  42 ++---
 2 files changed, 210 insertions(+), 25 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

