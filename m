Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286F633EAEC;
	Fri, 27 Mar 2026 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654986; cv=none; b=UGFqZ0189Qt/Xm1+M4b6Zojcz71y41e+AZn/P5UqKhF9Zvv6t2XFRANrDwQboraQMg+voUt9sh/foGwWqFGJ5VzeiqIB+PfcPkjZgg3W2G24/xE9QDibWlamdO6uIqwmNNJilXow3YJc0dfLgboJoHXlNWOTQ7+iqQ6psIOQHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654986; c=relaxed/simple;
	bh=ixhiMlX2mCeysvMuGEHB/XM9Hc6FHZMP1e/kgiArLlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpMQxUMmVfc0n96vvd1sxSpa+W/qW383coQhm/y9Rf/U1jX5Zu+dlXePsYvwaRTNh6b2HuWPvPgZCU6SF13iNF4nFH8CL/Zz6GYEyJrb2DmQWTEMQ8cZTmEQpZhba6X36Qz7+iEndz7JnGZ/qt5azbYlQjXfFFFHpxaynGkOF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DsYv24j6; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cEswKJzX; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DsYv24j6";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cEswKJzX"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHJQ2xRtz9tWC;
	Sat, 28 Mar 2026 00:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d0XRUkzzW1GJz/dTVYQ6PaZQddfUNmSrvZmLTzAfyA=;
	b=DsYv24j6NH4sSFkMofAM6W9GVnlzi09/t9/0trnmoICTCN0DGvRtwPYwdF2gJaEpU5W4z7
	Ed1riJrEBUY1uEzLr6YtLeziO/i5gQv47DDDi15GfEz2MQMwxHb00cjfQ04Z6i6Dm5zJVg
	BCoohlk9WC6vLH5S34trntQpiPAeVBTw1n7fhhdw3E85pqFBOq5cxYXhAImUvx98yM4GYo
	qj0D+7ShTIGT3A4aZb8TlJ4CpYIa/Ifl/odtAgOxgpHn7YhodXUt1prZCUhKZwb/XR+046
	OuqSKwUjODL8skStpflxVDYoMq/sadl/DLueazS7eKeG0LL7RRW72hHhWo7MoA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=cEswKJzX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d0XRUkzzW1GJz/dTVYQ6PaZQddfUNmSrvZmLTzAfyA=;
	b=cEswKJzXEjOrGkMo/KMb+Cow7dkBvoROupQtW7uPDZs5IHHRJFNlb1DF9o6ghGwHt1xqV6
	tQZHXv51Ej75hvIYucw5DGiXmpHH+IK7O3/VRtxAmLSWaqP3IXPvEDCzoAowT5QQuFouwO
	YJfqm0q/q4YqZWlptK/Paj/hYqW+PcRIGCinrXV+pVJ2jJnXgE+aaitRjq5aZKSEUaaAZY
	/+sJvFhGOykxPqZDAr0Qtrrdn9K7jGtLos9EwhmOwzaMXeXMa5CNQn3vOpMUEXY7ZgAowK
	kXig7CdUuP/7Ftqi9eXVgSpgHesNcYwHJDqTOOO8PavXdbgntvJuTPCCJ7gbNQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:09 +0100
Message-ID: <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d36fb0b84d85ff3c2b
X-MBO-RS-META: jiqqe6t5uem4snfmxsmqg4gppsi5t4ss
X-Rspamd-Queue-Id: 4fjHJQ2xRtz9tWC

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100.dtsi:40.11-46.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 245c26bb8e037..6ec57ffa72e87 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -37,7 +37,7 @@ b_clk: b {
 		clock-div = <3>;
 	};
 
-	bsc: bus {
+	bsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0

