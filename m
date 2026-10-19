Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF41A9F83
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376852; cv=none; b=KGL7wkzeEfLScIIWBkJC7wPm/t8ch1ErEt5oLhJSQKPvmMz4JQzMSoKi+mT7VH+dCln7zVFPTGp5QYMsJUUW4yo6KrlZ5fiEfhdYK2NLB2oiMJbGmmIoGuKz5Y9UcXQ7mcWVwg+ny8FVKN4Zp/hPpOXVCBc38QiE7si6dTZqt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376852; c=relaxed/simple;
	bh=ERKbFmN73N+bFdL2Y7WXwHzxqABDYzGdg5NtpYeJ75I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JiDXWcSb7IXBtWCTDyjMdm8SdhHNCnmXhGz7Z4Me3ZeoL54fa+IHE3UnLTiKUW+FfEoUGdtLcgZbbfWCNE1uYLryRub/fjLF/WnXfBMKx18s0eUxwx3CCdxkzrQNeWr/OanM9eActhQ7VtpQS8BgBb/0mEfkkEuc+vTZgwjGVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F88pOb7G; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F88pOb7G"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so190042b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376851; x=1792981651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=F88pOb7GVcNqqyngT4WvNp7mbEC1R7hBIqrULBhQfdNXFkxiKwxZLkz/55J8yWm+70
         +g6aJMjITloqkNFY/hb/cQ6qkF2Yg3rM32/p1by0mBHsqO9nf3m8qWxvI7DsMTHM0xWn
         hH76tLsSqocTgHmbX+E6dFhBGc3qfjDq2vEoxGX/eptWYQyUtfoDGMB3cVf1qJW1DP1X
         Noy7CPmNctodbW9ciGysnaQeo8LfOvzfPpIYN2un4OMwhsdLeIC/o7tjZILyMsscO4D+
         1Bf7ibayo7OfFHtsp1iTQ+ZUseGCsqsch2DXWc/NMoxcntcLxkHMak07U363QAGppr4c
         oHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376851; x=1792981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=S9wdP1vJTqn4lUIiWNTWGNio4YWHSNd1fZKzvBKHUiyDmrFZpQBYIaeewVud8L0uNE
         wvKqVBA0wFeWwuY6uOWWBJrOc1pFqtku1OhTw/bBamoPZC9lX0aZ8550lUlNm5iRrx10
         rrmoG2YdSQJ6iLfIrh8sfughXqCXAJW7zwVExrWGXgT74hlufUSmhntQc7osZSqmfsoN
         CjV5+MEECGVkhd3uVeW7ritUcuPiPqn0Exmz5v60dHlOpUzqQGPoR1/cTmi7uFCY0sD9
         arOXBr+Fka5mByJ+FvLUUtHC/uOl1w7QBPLXwijzEZUIORHTPiqT1SI2xKUleyD6EC3z
         fHpA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ucrICxn/3MAqfBZ4g7X9/UbHVrhpwDtlu59nGbg7Q23J0rxhhdfA8JfbcUQjluvqUlj28Uh3OImD0AXV6uNg7g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5MRmkrlMs0AWDXpYOSjDzG6PxwBfx2wXKuDevcOGyyRVYsX5S
	X+qqESO79mevNCrDnRP2Fv6kchK4zvWkXV9BNQTyBHhtpM0tPBkT1oowSDm9/X51uIg=
X-Gm-Gg: AYBFou11XPobCL7Y8TcfTEEHBREe0p5yV4b1UKnOCDkGNnBGED3ceEtfFg57hltQtqv
	5x3pjJJzsLmuGBDsafX9VejD25VlxDwiToL8cSExsXhhIAwK8KNbkOLRXAjv2gdM5oJaz950Q2l
	+A1cT0Vkl1Ae3kym6yPuQqEoMOdo8gk4dgPPER+gajtH6+go6nniSSu6K1+TZ6IyuNpEeOizRsO
	SjyE7+M1q2UaD0bH6ad2JsOUyiva7/LnNvx1Asxla1MszFrkUj+RtW+/6iBJtke1amGC5kwH+Xl
	8J7caioDXy0JlZtJDvQQDcQbRiChPPFEiYuPnaZrV9AU5Cdk1pZgxYR2v80w8aQ9jqkfqjdf/aC
	NLqZHOhdCn+ndL1JcFk/R6v7+NajaSR5FZa2t06Fb8ECFDWcjMSHA3Me3TEYo9B9vZGaMEdO948
	qhSxIZlJMGT5Jqw61f3uJ6ESAun9cxeUzdShTJdntViLGq6wYZfYdMXdMuegpFsTKdqCk3EG3oM
	6F2XhMj2lPpOA+6EmWFdSaK6foRk7cy
X-Received: by 2002:a05:6a00:22c5:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a04bc2d679mr5099071b3a.27.1792376851039;
        Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm3240432b3a.29.2026.10.18.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:27:30 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: daniel.lezcano@kernel.org,
	robh@kernel.org,
	geert+renesas@glider.be
Cc: tglx@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
Date: Sun, 18 Oct 2026 20:27:17 -0600
Message-ID: <20261019022717.511096-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artem Novak <artem122novak@gmail.com>

The Renesas SH7305 includes a three-channel Timer Unit (TMU).
Add its compatible string to the Renesas TMU Device Tree binding.

This is an RFC because SH7305 TMU0 Device Tree support is still
under review.
Feedback on the proposed binding would be appreciated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>

---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..8ecc57cc3d91 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,sh7305-tmu  # SH7305
           - renesas,tmu-r8a73a4  # R-Mobile APE6
           - renesas,tmu-r8a7740  # R-Mobile A1
           - renesas,tmu-r8a7742  # RZ/G1H
-- 
2.56.0

