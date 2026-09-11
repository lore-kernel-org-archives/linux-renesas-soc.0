Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8669830D3F6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096509; cv=none; b=htASfAYqkAmHRC4nPEmbrFl0iAJzdRcFs0m9O0MA0LXlWfk1gBv/Deg84CdrThmIKdk3zOwiE1ZmtlVn26/0ta37P6ZDU5hPG6CQeEJpJSTDnXRswjSPjHMzRqPGS8RuYwvACS7jraMlgeC7fy3rShWApQnsj9yXMikdSp8FY1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096509; c=relaxed/simple;
	bh=T9/TW2cLGEYS4bEK3G5XpNy2ErIWmUDDxIv1/6DbR9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdfJvNBvi4KEpnSm4FRYRIfPC76P5Cgc0AfRXXPQ7W+p5pttQTE2dhILjIz4Zu2ziBGezSuJ4NzpROTlAR1QgWo8dS0vVQXHQPYKsYG7csbqDucI10sqHspg84zy+6YZUzks9oTTWatuOSDxjE+jm6eumPtTa5TJHnZI/KjaitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtGwf8xS; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtGwf8xS"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910704e63a9so1621306d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096503; x=1789701303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/Er1eDnnKElUawcqZSFtd5s2k6qLXgoYfExyajlAOc=;
        b=UtGwf8xSIbETNAbb2Z+fgneKGHe0k56UuXgHnKqtsh+nHZWHEjVlZBql60FP2bsUgY
         JJns87OeIsirPfzVoZh8SCt+BzPVXCV5Of0m+JhXKBjGp033Ia/hogEXugnXtVWlefjF
         SVx5ZUfs0MT6xNc6fLpw+bFeAzm5FbZi7N0tQ/xiYPoy2jXCXIBcLosk4/FcggI3fMrx
         6FOCzokikjx+OMKSBWsHNuqd+tYhibOclYPDUqgEv0zaW9+irwTwmTR+4IL/6kYgDc/I
         vk0hhJJWqA6eOIqxYs57SlJYt4tAAEE0BsqWr2epZSkOi1cwCQCr1FVSTwL/qlOxxv4Y
         cUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096503; x=1789701303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/Er1eDnnKElUawcqZSFtd5s2k6qLXgoYfExyajlAOc=;
        b=f/xl82aTcj6r7VfNI1tbJv2lQ4YQPIxv4t6H1E2k71iZgDb/wKUjuey/v0tWF3h0EW
         j9ClXj4jp8uUbTUr2Y4XqBKTOtCq0RYkAUqzhs52dZhuxdUnsWqtpKBEmuQ2i+IPIGRU
         J15lOfDqV0IQ2g5gyMkhzO7cRNnAUD6NwB8EWbMqxcgdb5b54M8SpHbc8SuZfpDiFoFS
         aTWmatO9Udf7dzPAMpLG2j9SsyAShA7K/hvxRWdP3IKnOwddZEilEC+OvxvM3h2VRQYH
         6KX3MX6ZGrKU6qdsXB8mlC/6FoOXfbMPBUPq/aHQ2hzcVQCOtyUJcNs3lqWYCmOLk8ih
         yCvg==
X-Forwarded-Encrypted: i=1; AKwUvBxqDivDME68A0/7uz4NL/1wIQG/k3lkgUOAibl9l1QOU27KLPNYQumoVANJwHXnqpGZrQrcB28WzAEnfWT2o7wsKg==@vger.kernel.org
X-Gm-Message-State: AFuF++k5TNi5hCafxvdWOuL9EuUNRIHjNFc+3W13cpOe8CFwgtbaCUQA
	KM94L32WEEbfVI/hYWo87xhV5hPQYS3wbGOsvyaZ1f1SjU7cgB1deogXBIsr+cc=
X-Gm-Gg: AYBFou2a+d0ta1u/w+EOjFiTgNc8TGENu+PDH30/i7VLXs7MZ00DWSupzX9tZr4d06G
	SaI9Bn+Q5Klpj5Ms/EmJMaAVBuZTU99Fbh4p1/pVo1I7b73efeDfB/iCr64JVeGubPV61vXCU31
	AmZ480PUj2oo6FBYK2vILlnlkEBKSN6I1D/kDlUtmzHe0fXs3Lt38c1cmtzm9ClawnKdZlogKEE
	q6G3nWSLxfojTrIamG3uQlSdJOoVmsq3LNySTq9Oe8ZmZaZ8xet/8+y+XTYzS10r3S3ST03lM1u
	VccJaHKC3SPoFHZ5g/XeNElhXxBjXmHYb+BZLCFVhhuon9e5Ad5w/ShkxErpYVTcIxrJqIiDGS/
	isD2PY6AkTbiM8iiIvy6YHcmkGvmchJTf+FFWBoD+fGrOsiX6Yr+zNsk9kd7LdIuwoaCFmfeOGa
	K5bPS2Xhl8iAQ7sdZvymHb9HwnzWPDEvj0mZbK/JEPSVrKiiXgqpudA4s+ttIGCMsTQevxArglp
	Z1wqJtnGSXIqKbiXKEA8aFuAGetwSwPf+fbcnASuAiaR43W2sREJZcZPsTp2JNCem5cUTvMQeL1
	KCWVS0yKcMNOlTuuQRRiixpXpdS2aASQGA==
X-Received: by 2002:a05:6214:2529:b0:912:5b3:c193 with SMTP id 6a1803df08f44-9120eaf2767mr32388056d6.2.1789096503067;
        Thu, 10 Sep 2026 20:15:03 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120ef650a6sm11625536d6.0.2026.09.10.20.15.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 20:15:02 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] serial: sh-sci: Unregister UART on sysfs setup failure
Date: Thu, 10 Sep 2026 23:15:00 -0400
Message-ID: <20260911031500.5745-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sci_probe_single() registers the UART port before sci_probe() creates
the RX FIFO tuning attributes. If either device_create_file() call
fails, probe returns an error without removing the port from the serial
core. Device-managed resources are then released while the port remains
registered.

Unregister the UART port before returning either sysfs creation error.
If the second attribute fails, remove the first attribute before
unregistering the port. Keep the existing probe failure policy and leave
the successful initialization path unchanged.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 5d23188a473d ("serial: sh-sci: make RX FIFO parameters tunable via sysfs")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 92193eb26abf5e2de6386389708e635e42d33c8b..50ae9aae6b6146493a5c080a0f0cbb7351a89b3a 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3937,12 +3937,12 @@ static int sci_probe(struct platform_device *dev)
 	if (sp->port.fifosize > 1) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 		if (ret)
-			return ret;
+			goto err_remove_port;
 
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
-			return ret;
+			goto err_remove_port;
 		}
 	}
 
@@ -3952,6 +3952,10 @@ static int sci_probe(struct platform_device *dev)
 
 	sci_ports_in_use |= BIT(dev_id);
 	return 0;
+
+err_remove_port:
+	uart_remove_one_port(&sci_uart_driver, &sp->port);
+	return ret;
 }
 
 static int sci_suspend(struct device *dev)
-- 
2.53.0
