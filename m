Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DD242AF98
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275029; cv=none; b=ahuqwlkwlWgekIBjX0eFRlDYoTgtvuj37FmySGYFB25wL6faK34/K3iZ1VwaVHOpgdk94m3GySFogRhsGn+dBxjKdEb1t8cvTV8hZazrbYnKD4GzNa2l/RnriPkvikwObFC9aqngUL2iljHgUQ8WpQwp1J0Tvde5TAKN7hgKRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275029; c=relaxed/simple;
	bh=VMBfELsDgdw4LHnXCPqjLHfbD46aI9SXxvEcWut9ryc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1TrkfWpttyr55bDHtPPbFdJwOt95Vfet0GuOAzHsIJLDt2cM4bpqaZte3bN+rwpCMw20NufrTtrFK0FKUvg26LGiK5bG705yGJe24748fS332Jh/tdiXVW9cyoTdMmg5dsBbvGo9LUrF3SlW3sU3y8+h8MCsaI8oH2J76NnkDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6SILfdu; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6SILfdu"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso3187468a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275027; x=1788879827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=L6SILfduXNcawc/86EgpqprNbViGFLiI8I5eUqGwBhAFWuhtgZpfJnxPEkMWACUecT
         FuAPQb5oOFhcLqI60Yvg51kiLcz5G341cQa9t3rM8/J2oTQO7rKtzaomYJR32QoMMI+T
         OiqSkcuVNMyyqwf1+KuVXUx8oyn80Q/rKDUBqeeoWp35V00NUDBG3obeiDXhZcqgXaa2
         wdjr11qU8cIywFMG8Ce7/vMPaWBpKKXGQAjgnOOYurrPTkorTJpnBHP4UowvIIDGhk3c
         XeWt9wawqDtkiHkN5he/3EG2nfVruXRji3cChFpouxqooOS5TxcWhXJ0Ld7DeAOKkic3
         7GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275027; x=1788879827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=TcGawEoqpHQk3tiNIhHDPeFsgqQtzY2+29P69qyCja4rKzUZ/SaNDQkEs7At/zxrnh
         M+ZeIajClu+td5cPBWS7c+5IrG5XD2CCwKaTFwITIWDGXnNg0cKhz8PrrGZPu+WUNqD1
         qI/0f733ca38EX54IDxGKOtT38BDKyaWbie6Z64kpgZh/glWzf4BXQmuYY27SAxprT8i
         IbHW8Ps8Q+5ExBt+aM1UJ7RIPyxBHPC76m1N/4nbEJ6GKOFj9xRlH/QaFtLadS00V2HN
         D8v+UkwMOQpckcBtV0jrjFXPpedg2ubAGlSAiabhYslkcP6DyrTeT0j5VdDUDIlNnPE1
         hcyw==
X-Forwarded-Encrypted: i=1; AHgh+RoOTOfNX4QZotTC3CjabfSDsGeqkwSDeESMuyd/IUQh+aWxYg+R/cUigpWU61ovTDU6VhqZzgwXl5vLaIHgzQE8tQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kpnN2066+LaDMwYVJvJUcCKeEOLT5XBu6Trx9M/eXoZ6PKV/SC
	EHT/YjadINxU7PMdEtkojIy7WCRto0NgvF8OUBlddIqpXS8KM6PCZu0joj9dI12RqNZV1A==
X-Gm-Gg: AR+sD10k/1Sb/8nXJ91JvDHTvafymhf14RQGcLkDK77jkKq7FfI+pkc5lNJRau3hjCF
	fViMvxHYaIpWbMWpYPnn1k2J6xqKHW4dVmESJqDYi7kbUx+COq5hM8eGLnn8CfsqGJylkQy1iF6
	DndUC67xsyCBhIdfC6N1l5fGVDnm9rCqrQOQexxt0tQ6PIAKO6liV7eZlb93m9jGMfbYf/we04i
	SP0rCaHesiiYPMl1KbxKTNh2KjmniVq60H9BqcmlDaM45xf7kItr3Pzt6MKZ03OD4ZjTDoKjIie
	zo/zwlodQnys3PFq7U0vQBOPJwH3QQDSg9isBTFxnQLjPX/Wl2zbQ7qIWwsdBS0Y/vJtn2DNTkY
	XkVwGPrrKfwJaUcIBDaO8K1mfPAnqA1Wy7pB2TkHwYTLIKJgIbo/w4mAMtkdWbLnp8Ta2RtRRoo
	agRZfFa+6W1z/Mu/e7ckqjlpGWIhYyMplCs9heqO0gk7nRjyYnr9ukT5qbAyY=
X-Received: by 2002:a05:6a00:4501:b0:857:72f8:dc91 with SMTP id d2e1a72fcca58-85772f8de55mr39669660b3a.18.1788275020723;
        Tue, 01 Sep 2026 08:03:40 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  1 Sep 2026 23:01:10 +0800
Message-ID: <20260901150111.141037-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..c3b17752cc817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23744,6 +23744,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

