Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439452;
	b=FxOIuOgDE0X83PGbMbnzXSy9fp86mJ9sfhUH/JDGS0zbAUdObJHqtm47rgIxIGVx7NoK
	 oi+5xRcM6KTeZz2Nkx6fvHktEuvxuCGwqjVfFJOk7YG9OinQ7la90gmRE+y2cYYE+l6OR
	 /531bednB/8L5AYYa9eeD9X9E+Q8/MreaGraT8M6SdVSrofsi/Cmx3kdImxo7TfEwsiOq
	 3o+tVuRdbt9hOjSI4pR7H7E4xw2nSkchoIa0laAsC+MS56O3JGuZH8DZ2sfZeeMMK3r+F
	 fxnSzlhaxf2JiK4Eaq17ops61x0AF4hHzrzBKVKhq1OR/1I2A9DT4jUJenhhjOc6VSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
	b=OgJ/o6SvedB1uJnnr3PjG186NbC8bu3PKijS/5xCnGK2r816k4K8Mv18r7tu83QOgwN5
	 LpFMDD+TSB84CBDpmxRR7Qr9ct38a5cvzZJLHlsAefWzGiODY2wFrAYUyQEjaMTSg7Wa9
	 /LzTetX0XtqEuc+bNDMb8q57oADnzA9SUpbF6V64ml3g5t7Nko/dTd2hT5T4skJd0J4kU
	 TWy1aWUf7+I23lZZzeUfxarwuiGwrpIHLO1nJ494YJLV+r/F8GdwQ3jvr1UJMkmBqeOB6
	 4+1Ut9T+Mi9z6SyMyFRqfv5KYjIguE3qlgWPAys+pnTiGPmOTXhvIuuhnnq5SQnKBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tneHtAfD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0678E606A68D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0678E606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tneHtAfD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23289625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439450; x=1796044250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
        b=tneHtAfDCBDR5o/j/eojOO0BbMdCpa/FhNiwqbUfae0KUYFL47VIs+tTHGqh3TGSav
         ci5XtM7JoabAeTa/h5zOXa6gT6ych1EcMkcA5BvbwkWEM9fyFfLCNqCvtr5ruGi0vHLh
         +90XBrHxJkVzON3xk/laL29zItoOqgwzxi3gs3+MidhymHXFYHjJS2KrfnwRRrpWIAnz
         8zsQSRZk5TazapCv5n6exeh66fTXL3p1ALkI9wib2eUhEGspV5tRmjkugW8FwVtU/jrc
         aygNj/fn6UChnQ+q8nth2PVyStoKzja+qBSfUhyDJtSAEsWD9cxMQ2DcSYvMa0VwLE/Z
         qSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439450; x=1796044250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
        b=VbvBrFlKtk/pvjEE2oqynBn48U5GrJgYnlq8C7jC7ib9KHBNfDqL1GZpSqVlgtW05O
         J/COgwH2Waz9VsgkniSZUomni1gxbNf3M2uJkGmcsYujj1WW14ktE70vXgnIR37YWT6J
         1oJ96aJzYoUFssI5rM4n8JcXLC6PB46oDCCsLcA6Q6BQdMOJFeDFH3qNeS5lT+jS2zO2
         yph77IFulqwF2Gv4xAN5fvUucDK+2C/fNYmg50tCZnpqlriIMUK3Iq2PSIqkuSX3vT9v
         dEe+BHoXIaRqSQbXnQYObSZwUtpXqPgOY7q152oQIm8ENnfvKAJbc5JPrsQ/LQGRx0yI
         2tgg==
X-Forwarded-Encrypted: i=1; AL+hErFqM0+KsclXHz65LlvI09h7j1s56Va2DdWSZlPzoo5y9EzCg9rLEZJGj+Qre0WelbRbCw3bE7hdooHCD3tELdEIVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HULgjEyFcR+M0Xy3LjZ9i8SHd6+03uBr18Jr3d9ll7IILBHMA
	c0rEQBzy3cVLYnZ51Dm1djDQxMjKndIIK/eWmtqe80mgctNQOX+FHnH6
X-Gm-Gg: AZFdTZdOZ0jH17p2DG+fsXqQT47QM01UDrN5We1Ml0yHXa66KZU011itAlkZC72oZuN
	gULIkET5UDt09yx95I9ypXPDtwunoy1bLPn5FaKf1oVIrBmuhOh9CGEbo+kEMjOx59q6S+dY8Dy
	Vbfp6UC+Ny91fhU+j3/mJuSkKRoTqL4oXYlcTeFS7pOXbGqYU83Zlip7IZqDf/DPs0MMNq+9uKt
	Gc3AIgjWGHPKBxClakPZplnB87TC0H2LzJEGaOL5FABFE6N3R5bhx6uC/YRN00CT1ba4EInE49j
	uLOsMWdIa2xNFy3PK9JVVaTJKfLqs6HYG+jQgjPly1FaWZJocQ8T+KyEbunBMyWhBq3I0TA7n/H
	ldoGwQDM64U47/FFShvF3Mcw3xgA4649QOgaDEAmgyZPF43zAjIk3IRaHEAScRJzuuWOh2T6L36
	Tii3w8FoYposl8SIuMiQLR18Zu4yJz8unGb2j1tPiPSoWXUzn2M3syz46R0vz+OL/3J5Fh7jwdS
	lqEJOpFNzbGLwNCJ3yESkyoy7MvLHZC9JohBGL0XDY3Rmn5zslRfwrB1XKflh1UMWjJ9leVrX88
	ETQfTpS1NcM7rsje9AUdOSLRqrB7zwxWpckiOqopjA9g/S2e1FO+SfJQEo2RmUUEA41vB6ShDgc
	VFzcGuLR4HSEF3WLWUtwsWY0XfmVxKoHWIoCQdkCzz63dopB6+Ctbn+1iJdLG6nCqZfTHm7vAHA
	==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr224591505e9.1.1795439450439;
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6 2/4] net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
Date: Mon, 23 Nov 2026 13:08:50 +0000
Message-ID: <20261123130852.3420491-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 hardware manual places the VLANTransmittedOK counter at
offset 0x8f4, not 0x8ec. Correct the register offset so the driver
reads the counter from the right location.

Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6:
  - No changes from v5
v5: https://lore.kernel.org/all/20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..9693f8503b0b 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -185,7 +185,7 @@
 #define A5PSW_etherStatsFragments		0x8E0
 
 #define A5PSW_VLANReceived			0x8E8
-#define A5PSW_VLANTransmitted			0x8EC
+#define A5PSW_VLANTransmitted			0x8F4
 
 #define A5PSW_aDeferred				0x910
 #define A5PSW_aMultipleCollisions		0x914
-- 
2.56.1

