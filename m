Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603887;
	b=kZ+GIcIhmbwh9upzCSIK7Q0AOuRhMAoAK2L+DOwc3ik4G90xepjv+WJUri6cvlhYLZkQ
	 jQCTZ5wSoqpzv+9EXcdlb8FpjfH5Axyo0mz4tegE3aoWe5Zo7vpRt4+FN02Z+9ZIdmLhs
	 IPn5z1MR25WlbNpbQr5Bs4O8cWuPjDXj+8bvfYDAr9+vyLNmc4OVFZU11ZY89S9NeZGLn
	 kkYCzQYdupQ4fnAqStBq2PB2TG1W4sVh4MbjtCBfTw+u994IfbkpGmsS9J/kTDJo4sgvS
	 hoxtBgS26RS9rDxVc9M73AcTFIgUKWodcRvxovL1Lhuk0Q8e1N+1kkVA+UpJDaDmA6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603887;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tDNqmNJxhF1H9SqZrRXbRJE/PLsy7GSLRGHoHg3IUiU=;
	b=RE2axlUphHGbghPhJm6TBfdY9I/5aCKaB401+qWpOEh49Rpg4mnGvPbIu6SeLVsWX00V
	 MfIMH08XSbYIuvUCzlRxXNagljqsUmZefoBt+p2+Vq/aHW8zySfCkICx06Gi+/Yml9+aj
	 OxJT6NSZB8p9jIfqNdDIwd/6hCRAo03IhCsR2QUxdwBtxTI+S88VHtXBnHSEY8yvFc+5b
	 MVUMG2OB7oagi0B0Y9uYLZnhQeuXkn4TN6KRhQqNHZyyHTvjacHv36lXigceklEscWCNT
	 Y145Pc75aq5LOr+YAsYi2AqiN8cBSrqCbj+MqmmtFofazAPR+NTJdaVXZMWx4tDBeUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C+ngV5w5;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC02606A326
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 10:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C+ngV5w5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=tDNqmNJxhF1H9S
	qZrRXbRJE/PLsy7GSLRGHoHg3IUiU=; b=C+ngV5w5sFKakSSFXbr6ATpWfAg8sP
	QJTnvnfSt+APKj+H7fZnkn5Nd7U3Nc7BXes+Mw0XWlL7T8PnPChRzoZ/fTX3LcfS
	eLq+I/xe8urDlQ8HW3BesYAbW4ylfqzcsL4ttEuIFMNHWoChw6TpYEKMrKCCIO6B
	/At3VAH2qK2+a4+4uKIyUpBmIirAtrn6pxIxDBqEvTcTmlAWIl2II19QHyVidBND
	Q7tobpoV7Rjgrvz4+q7pu/mhB8MAFkLjgvjNUxnpYFZ5SchVQ2l3+m8Sr8t1rL9k
	L9dsMgfacehiG/BgXAjNA0DUPNLeIpmFm94Ozs58QdTzy5mPDeFv/NHQ==
Received: (qmail 885822 invoked from network); 25 Nov 2026 11:51:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 11:51:24 +0100
X-UD-Smtp-Session: l3s3148p1@lRSpmxdhBsIujnvc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C driver
Date: Wed, 25 Nov 2026 11:49:53 +0100
Message-ID: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
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

To make them show up in our patchwork instance.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I missed a patch because of this missing entry. Should go via the I3C
tree, I assume.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..dd48e2268aba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12707,6 +12707,7 @@ F:	drivers/i3c/master/i3c-master-cdns.c
 I3C DRIVER FOR RENESAS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 F:	drivers/i3c/master/renesas-i3c.c
-- 
2.53.0

