Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A914EC73;
	Sun,  3 May 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823088; cv=none; b=kyiNlV4LZ92hAt7sFNMM7SzqwEbUINryC/fhv+2EwUmo2UKbgVX4WfkOP9oa3PrGRm/uj0tDf8oQJhgX1pWEPz0sJ35LdmKL41Arlgz5hnIAe3K4uO8hXHEvCDVUUgBv7fJhU8tGU/Aziv4K75fa4rr984012AIcQBOEFOS3Qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823088; c=relaxed/simple;
	bh=KvrSzVRlTtgdyIyOHllZeU18ckjlbXnfOtScHBIg2+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsnmQBmAApwfxxvtH47zCSJbHHhCFHAuCCDldfavGt46EfnLZVNU2ukrHI/1Ck261shkL7u3pm1JoqQ6jQZaNg0VmnFh+5UDNtJaKTUFwhtPLxs3C4ML8VbcRziJsFhIb8YxMF2C+h8OSXfsYI7pX8F1KnrVo+ctOez2nt0/DxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NYF1sa57; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U0gP5MBz; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NYF1sa57";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U0gP5MBz"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7pxS0xq3z9tRM;
	Sun,  3 May 2026 17:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777823084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C5ndckZy3D++ygR4S2KuLZlKgbLjiLF0FZ4orIPcy4o=;
	b=NYF1sa57Mu7V6hHn+z/sgUVc0p2VzdOu2fxRzR0Q/nlqSXZZP3Yxg7deD77CNd3PB5o0+G
	ZIrWrknCgmkaO8g5a//sdYHH+e5pki0kMiFkJvDn7nr11VPSfSfdHd+AqiEQthnhiwenux
	RQugUWpmp6tI7UHKZzmvOEJoGlVB0MrPeTsCmuE7iNpvaqv5IWehoNzAsyqpMxtvN80HeD
	NHwhGiBh4N+2P5H+SKIbkRT2vVYiLZGG1GCnrSshjAtIaVmwmBNknZ2d8LPmnjWfIiCgsR
	2ap7xek2E+NJeFuCRCCd0tCeIRHybZRqXnJbtDXP1wxt+BHktc9uzzDSycSkpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U0gP5MBz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777823083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C5ndckZy3D++ygR4S2KuLZlKgbLjiLF0FZ4orIPcy4o=;
	b=U0gP5MBzbWM5mlEYDBACRaWwxW2CAsnl0H48y1IlyPg6UGxFA05hAu4lBpvZ2tTwqM6FcB
	ifHQdKJyMiLsa/RmSNaL88d70y65/yY5dbCzuVDQhtDjyxakT0kxVjjeDobo3aFRfagDtH
	ybg1ClfOZWYoXBOskA7afdlg8iC9LitWJnCVclWNH9th/Hxrt+lcrxbS5cSSYz+UiY04it
	coXAZ4O/OOMONWcIQNaLArQYrtK/+PmpaZvzvpMqIjlIRLg50EAB1wWpJsPDM0M3wtP3o5
	KwVNcqpywb8BiouEt8kXwQkDxcPspYKN0bIP4rJatp+1+564BT2unP54ZSzCZA==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] schemas: Allow clocks: property in cache nodes
Date: Sun,  3 May 2026 17:44:13 +0200
Message-ID: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7fa1ca7aec103e1c8da
X-MBO-RS-META: 4xodjuiiisazkf7hch37sdzhftahx3kq
X-Rspamd-Queue-Id: 4g7pxS0xq3z9tRM

Renesas R-Mobile APE6 currently describes clock which supply the cache
controller in their DT using "clocks" property. This is not the only
hardware that has cache controller clock controllable via some sort of
clock controller, for example Altera SoCFPGA Cyclone V and Arria V also
has controllable cache controller clock. Allow clocks: property in cache
controller node to allow users to fully describe such hardware.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 dtschema/schemas/cache.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dtschema/schemas/cache.yaml b/dtschema/schemas/cache.yaml
index 73d345f..dee1cd5 100644
--- a/dtschema/schemas/cache.yaml
+++ b/dtschema/schemas/cache.yaml
@@ -33,6 +33,9 @@ properties:
   compatible:
     const: cache
 
+  clocks:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.53.0

