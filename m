Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ADD3E275C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133300; cv=none; b=TK7DtBleRqFLgwM5CzcXDqbzgm6Cfx1ZObvbIhsfocpBEcobGUP9iG0E8qLqCw54vVsG70eRAZx7RiG/kr2qSLm87cs77i2cxIng0utkzJAu8y9YBm86/BfI2c/2Q56TWHtdutTmwjVpWNL05b4GLW6uajzHrJWp6s/iU7tddMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133300; c=relaxed/simple;
	bh=eStbQ7NN4DXExlNiybRaL/c4YiUBu327h6xKiFmu5+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+CZc3GOkx4TZPDXpUcJmD8PgrSilu8L1n3+2rJ/Db7/+cB90xRBHwExc5a1wGqI3bN27pmQslq9NFggHqxLUNCdv3LuXvUZOm9z2VVkGCbuhjT0/7jbibNI5DkjlXc4Py44iur/az4ykrtSEm4FE7FfcxcIou/NGR6mbYMuwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iGFoLekf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iGFoLekf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=W+cQeTx6S4ds4B
	GxhLTkBNyd3ZcV8I13pYxsoMZUT50=; b=iGFoLekfb3tjdf+zr9G0MBfFHkXsLc
	B02doBOEM4d0cjom2rr8mU6m0QugV1Ku8x5NZ0TM2AFW0/z7EQuN/HzKUxPOBLiS
	CtwwpReFyWILxqzHqOBZ/1rR9mVGEz6SkSU6sKg+oMz0r0T+KjH6Xx9Q3eqStwoS
	1AJ1+qjr8tmTh+2RhzgwIbX63iigY3tBCECmd8QVoaacJ0R5njoU3pdkNastmhI1
	vEuzoaYKFJc6ScdqNT7cHJ/dTkFPcd4AdGPj6xof0NAyxXT0lVqf2FYX8gyQRIRJ
	SLHJO2E4TJdJvshjq78oRs51ndV9UdJWc4Qetn6mc+on4KdIr93b604Q==
Received: (qmail 2500123 invoked from network); 2 Apr 2026 14:34:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 14:34:49 +0200
X-UD-Smtp-Session: l3s3148p1@1mIhbXlO1INUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] dt-bindings: incomplete-devices: allow additional properties
Date: Thu,  2 Apr 2026 14:27:00 +0200
Message-ID: <20260402123444.14177-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux test infrastructure is rightfully handled as 'incomplete devices.'
It may need additional properties, though, like this mailbox test entry:

mailbox_test_send_to_recv@c1000000 {
        compatible = "mailbox-test";
        broken-usage-of-incorrect-compatible;
        reg = <0x0 0xc1000000 0x0 0x100>;
        mboxes = <&mfis 0 (MFIS_CHANNEL_IICR | MFIS_CHANNEL_TX)>,
                 <&mfis 0 (MFIS_CHANNEL_EICR | MFIS_CHANNEL_RX)>;
        mbox-names = "tx", "rx";
 };

So, allow additional properties to prevent:

.../arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_send_to_recv@c1000000 (mailbox-test): 'broken-usage-of-incorrect-compatible', 'mbox-names', 'mboxes', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Maybe this is not worth the hazzle because these testing bindings should
never be used in production DTs. During development, however, this is
useful because it reduces noise, so real bugs become more visible.

If this is not applicable for reasons I overlooked, another approach
could be to use 'broken-usage-of-incorrect-compatible' as an early exit
in fixup_node_props() of the validator?

RFC because of all of the above. Is this worth it?

 Documentation/devicetree/bindings/incomplete-devices.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/incomplete-devices.yaml b/Documentation/devicetree/bindings/incomplete-devices.yaml
index 4bb6c0141e9f..8f6df738f5e9 100644
--- a/Documentation/devicetree/bindings/incomplete-devices.yaml
+++ b/Documentation/devicetree/bindings/incomplete-devices.yaml
@@ -282,4 +282,4 @@ required:
   - compatible
   - broken-usage-of-incorrect-compatible
 
-additionalProperties: false
+additionalProperties: true
-- 
2.51.0

