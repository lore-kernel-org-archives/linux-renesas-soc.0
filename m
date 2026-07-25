Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE932DECC2
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982882; cv=none; b=A29NM8xqhEYNl4O1CJF6CVkvZHlpUza5ZYkYHf8q6g9gNixE73RifeiDG68ciy65fvnvvQr8D0u9UR19czkAtjLOyRx6h0UzjnC5Kh2sadwqsG7ZUq+3HljNXMuqlxUTFfHX/ap/FCcbaLfrrDSZwUq7k64SACxqynTKis3mH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982882; c=relaxed/simple;
	bh=cV72Uy3OM59T5r0c+WsbwsKbusnRMOQu33qdOdTbTaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+mtBJVBwk4KDiwyn2YckZkli9ytyQfIuyhcxjDCNvybh7SCa6jGAISFky+x22P0EHMXZ8r6+O+sPQhEOxXXdC/6zPCi9zl8k75Wku+EdxYgfL0Pc4q9yS19srYkzziVMRMZO2vbnbcvzYmTFOd2XRS3a+xyH2fhUDW2BtP5lCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSB4wQ0R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSB4wQ0R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so9617285e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784982879; x=1785587679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztvJjl4doZWZLlYuXX1oduBad9Tl8Ge/3zivRdQHCB4=;
        b=lSB4wQ0R+Qy4upa33f6bRjLTkFC6lmm/c0ewUhjbwV0EC3LT42s7ykHqCuDdXNKj6a
         9s267mBhAAEq5r5Lwb3u5hyyWolBktlLhBmag896QC3sbNW+Dxg8F6nRezUW7EMq3xth
         nkCRICRHlJUClATUyarpQoSbJtLOhRqJ/balax3Hl3VPsgeRzM6mA0or/7FbUOcU0QMa
         qiRBxt9w89DGQpVAkg0Co5sRJAcTunuobLjqXtMpixx8ADx7DMVzmt4ZEalZilnRY9M+
         czF7ReNqb5jKMt6fko9jKDjp5GvXQtaqDRp1sAIQ8U7MXYrjZ8ePopjh5rGdlLjvEevM
         BNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784982879; x=1785587679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztvJjl4doZWZLlYuXX1oduBad9Tl8Ge/3zivRdQHCB4=;
        b=O/yubXNjkfcOiTcMCX920B8cCiwIOvHwSVMYD1zE4d7H0UBgtl8UwRo28/Rdm9jXrQ
         4tnNRCXjgmDkfG1YMHDTSjPeMHC5SbotOjx3nsGo26MKbAygTxkPuWAC+BsNSHxvBXjG
         kqPafRzejEcmKrOTGXwyOLF7f4gSfj5sETVFaQY3pdFooeg+GpU8dTLywOMupDEufAFV
         G2io16pp5n9zF5k8PmTcHy/m5iW4Qd5zEa+QfGuCi1M8y+4syoGL2XDL6RfjmfstawED
         9VHQC+eEbW3aJyjGOUNFQADOOtkcAJoqBqWZOMZ0GYqvTgsq5FA/AchTlF9BVUE2KxjH
         tcgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0PqM4hJpm9bQjMaj4twwOxe60MBzu7CV/gE3Y+rOJ3q9XmzH41+sp3c0HGltAhQd8ZTym1ou69JED0cwi63+KNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xN0fO6QFdsHRH5GZwINa65TKtd34b8KrrtOJusDX+e0uRN6V
	lfVxK+AGV2Gqq+ICTB+drgn5z4bpRuMaW4oSCuL3UrkQeBCGx+WSlJKM
X-Gm-Gg: AR+sD12Ftvgat2AFwsU3cFOGauO77vssgI3e1BHmHvywIYVrsHPdDowGVkWAIWR4sDL
	2DQzBF6i6HAvTfvpNXcWQ1pJl38ei0O1GZvFz6MkK/rlOzg2rm5AGz0XTQb4xHyfk7ERt+sxgA2
	nirtBadTl2sfd5pokUeAdIA6dALb8VYw0AxnUmAVAW+ywlQphjOVasVY6lIt/40Erbn7lSGS1Lk
	LDdxpDXeth7LuNmed7DMqD7XNfUTd1mQfzUO2sn+4le+dvVCoSw19m+xhUpVcdi+5AqurhcTt5l
	gDVQWsAI4jzur/s4upn+9Lau2KxO5HNxdl5qBw3akRZdnOk7IqG9d5jNpTJhntldD82ZZwQGakj
	RZVddqgifIIu4rmv5UA8N5Br+PTL4YMiJ4RHx4EQrWJGT83voxCuDtP02xp/nVcVG3DPfz37iM8
	SFxBJj2KEJgJZBIW1ZToa19ggVww0=
X-Received: by 2002:a05:600c:1da8:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-496b56e6ed6mr28718695e9.4.1784982878526;
        Sat, 25 Jul 2026 05:34:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:222f:1bcc:b186:8220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858e86sm44563295e9.1.2026.07.25.05.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 05:34:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Sat, 25 Jul 2026 13:34:30 +0100
Message-ID: <20260725123433.162348-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
handle the PWRRDY power sequencing, which requires the
pwrseq-renesas-pwrrdy driver to bind to it. Select
POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
whenever RZ/G3L SYSC support is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdf18ed2dfc2..86baa5bdbab9 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -493,6 +493,7 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0

