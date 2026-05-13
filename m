Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B63FF8A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673201; cv=none; b=FJWRTrlQ9H2p5suZQ+RGn8GvS7RSOyDEu1MeLBl6JTjFzzfn5Qt81k8zKAiGsdBNoo4L2IReWPul67hC+c8Cg/LNX/OYFxpWnv8mZ/FYdwHmvAs6UML2gHQJjvndtmz6NbWxEOZfNg/vzgIohTx3OmyiKmQU7dJ2wcH8vmdACDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673201; c=relaxed/simple;
	bh=t64FkIjt8YPPd0Kv+ZYgqe/PVj+DMiY4kKfszshbsso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBfpGsBTGjpNBgIgufCR+YS6H5ZKGToff8cyWK+KWFYATIy2mcdSp9d8yxL5zRoMtjMAGGy6C6kywk6yPTC/zDjMRgk7bSbY2yRqEZO6/Dg/MfXWKzHTeEmkC+O3u70zDEtibhGRwmiuAHfonS6h8kVP/Gy/vLdietFjT6Rxo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPnVuhjB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPnVuhjB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4222389f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673198; x=1779277998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4+4FKRbGi0weZRueGf69BctThyZfUOKTtJTR9Y3Oog=;
        b=PPnVuhjBgziUQ5Ye2/2J7RQGT0zy11UyD4dEiWn0jaNngTGtcHoEQE660H7YWWSHCU
         gfyBo+ElX9LFonQzuHG3WDb/e5clvc9fh4IdUcF/XnXk+u9PIL1jd7NN7ZAGp+j9XtED
         RqzKNEnJZcCYgweQVAN/xCTBwUEGa8pLTYBj0qc2DvYQOcKqCbujCEpHipMc2I9m6ayx
         JQrK3+v8Pg1SHJjDasrr+Y70kcx7BonCL8ZtHRTybXik5efuGgjXN3NxBO/EOYEY5WeJ
         LCi2/1KKsUiVQ6cRSbMSY0M17p4pJP9/sMU8RtA+VjxKK1FdruWIdfuwv7rhN3oBKYXo
         oLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673198; x=1779277998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4+4FKRbGi0weZRueGf69BctThyZfUOKTtJTR9Y3Oog=;
        b=UC/CKmZCGfrta3Xfu4rhve1yvaL06iu/D/tIOepWLBnt6NkeUau2NcxdyEwamWoswG
         FMqRyLd4WgqOzMUWatBhJXeneBvAGDAPJHSUozUCjLIHcertfmDR68gUbDiDrTQGUgZd
         KVIbDHymclItkn1WA+l7sua6jyZFvzuSgDiRvOdf5B7tIC573E4Ay6LpLIm+iqB6I3ka
         rRJB5erV1HfDlHtDAJBvb3/ltP/yjgDkEVHtuzndmExuc74ncx0IvFSZmqVCt5msIQU9
         jD0YxHi5uQyOxUQ+g+AenwGJIU0VtjbAUFLsleaenaZ7LFz+Ep815TYKqyMNrzw4SHSz
         zLhQ==
X-Gm-Message-State: AOJu0Yw991RBYLw+WYEB2QgiHxDDDP0htlDZ+C2pyBD2jvH3P/ZrNuGt
	uSM7mZRK+zLKiiAceHhzyglK3029+0XfLWW6MUVFFOHAXwPmaZkmf74R
X-Gm-Gg: Acq92OFPZz3Gy33MYtepcalsFYarqPq+p5oSzb4P9eQQaFY7OnpLi0xIEnvMtTAfTHE
	tZ/n3c7RvpUysl3Au33zd8aI7WCqWfw4gLYPw164TcvPeG7b0sXGPUo0oaOaO4sSz6dgqMZ9UfC
	pv845lxBIi+iDVlkKyqQw7VnEuGxD5ILe/BpCWAFUTrV2INy7SWxc/B0eJHLWhJNzS/FBszkOns
	4SnR6WjjYRp3Tf2OLPIsvWR39K3iHBF4eUL2mOLFcXunfjfwilm9Rr9avGipEKJ85Wp7E4YVCH0
	XYa+0JoSUeri2/n8ehcUjUpqXKe9XQ/avvRj8DgEsQZICyyWYnMvU8h1zMFJoIzBam3Vas5Wim0
	rsaEyz9jOf3BCcrKtV1UxFBF867CvdKO5TqrQy1fHkqtHlx5DBtfFEJryIjX75eguTOtKFLFsGT
	caHfNQtylEm5hoZFQzUkCrcyBhPyxVLyVpCa8WQC2jvTzc4FnWYNHTC4VkYw/9MOl27UtNDRhjY
	wxg9J7uOqYa4/1OCIEvbzkpHsuEU5gkxY1M7A==
X-Received: by 2002:a05:6000:1847:b0:441:2aee:d561 with SMTP id ffacd0b85a97d-45c59cd2d7amr4822718f8f.28.1778673198018;
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] pinctrl: renesas: rzt2h: Remove unused variable 'j'
Date: Wed, 13 May 2026 12:53:11 +0100
Message-ID: <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Variable 'j' in rzt2h_pinctrl_register() is incremented during pin
descriptor initialization but never used afterwards.

Remove the unused variable and the associated dead code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4ba11a83b604..4b790fa72b49 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -1140,7 +1140,7 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	struct pinctrl_desc *desc = &pctrl->desc;
 	struct device *dev = pctrl->dev;
 	struct pinctrl_pin_desc *pins;
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	desc->name = DRV_NAME;
@@ -1157,11 +1157,9 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	pctrl->pins = pins;
 	desc->pins = pins;
 
-	for (i = 0, j = 0; i < pctrl->data->n_port_pins; i++) {
+	for (i = 0; i < pctrl->data->n_port_pins; i++) {
 		pins[i].number = i;
 		pins[i].name = rzt2h_gpio_names[i];
-		if (i && !(i % RZT2H_PINS_PER_PORT))
-			j++;
 	}
 
 	ret = devm_pinctrl_register_and_init(dev, desc, pctrl, &pctrl->pctl);
-- 
2.54.0

