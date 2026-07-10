Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63D3CA49A;
	Fri, 10 Jul 2026 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683081; cv=none; b=tplX/876h8DKwDON46E0jtJkhqFlrzo7SE4ErKVGf7+RZHB5pm5LYk2kuICN5BRfOsK4PTEQ1FbSbkH4bFiQvUHtBE6zH9U8lEeGZDyZExSClE0cqFQpE87AjKY2wiHtflZIOCGs6Rk3HHt/074Zxa6lTt/0qwYNF82MNgnbVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683081; c=relaxed/simple;
	bh=tGPfE6qKuA+vlOgrYeOKM12QStYUc80MBZhiTokpJiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsG9uXjXdvSqmtMG1bpIrYbiycCscDfAyxikkRydL7Qgck+qq3dv98O+qFjxoC0Gi4ulaAulojl06PnF22ZIo04A6GlyF5SUEuFOn3zNFextm6rw/xF108UKB8+zD/IP5WBAC/N5c6KUmyimWnvguGnOgDm/LmXsaqR6dJZQbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y/DMUIyx; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cct4uoRu; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y/DMUIyx";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cct4uoRu"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gxV5M2hnVz8tvK;
	Fri, 10 Jul 2026 13:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783683063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E0cvBCWOSMbGwMP2ewHHGiksfp4JHwRC4Wz6rZ4DvQQ=;
	b=Y/DMUIyxs4wOlhbanKBtphfpX+AMZrYoH0Xrtoi567IscZTpc0Bybx6Rc7UFYRlytDVoHx
	zSho24SmW9rVugGXQhqXwRxa2y8M2omZMv1wvdQ1g9artoCIjrZ2+Qf4Eds+/8tcJGzTWU
	zoM1rVapmlIylC/cTny1oV0ZtAV95spOxWf0K9avppvH5WFQ0pwjPmqWKEku1v088rgWU0
	4Kppj+FYp8Q0OXMbqaztOz9GkDlgYlDAvGFsU/u8fIZDOvDWqUqGWiEbGjolpOGEIRHaev
	ZbYPJyWgIp3k4jR9FSFprsJ39Gl46q29UQxJ2Zg2KEOVejPQq01mlVyrrxoyWw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783683062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E0cvBCWOSMbGwMP2ewHHGiksfp4JHwRC4Wz6rZ4DvQQ=;
	b=cct4uoRugBRvfRFa+hcsKo5XydDVHWDioptl4mRCckn2geJFI5JnNcSamyqSiUeMW9f24q
	/fbdtkGjRx5CxiQjL+yz4lOlO0mpW+YAMx9f9O4Ab0KZP2X4kucQ/daYPUdRvbfrkW9s/X
	eh9yIvW2x8HNu2qUbRPK888zoJ3WehAxW2vkM8/glWpWTlSgJxx7AOIzf8z/i0QqH9Fjqk
	0LZkpNt7eEW3IiHQZsMZHNP+DGAIdGAaeRmudZqA31mcGJ2jTWe9Ov1FaYxgg2iXdT3coE
	ST3WOXYmKQVcqt0iiHJ59RkH0T5ASJ2DhWUZHGXguKl14nkpmEZBgzSxr17kJg==
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: fix bracket
Date: Fri, 10 Jul 2026 13:30:29 +0200
Message-ID: <20260710113029.436415-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: d4o19nfdker7p7zkwidqgfkq76fstzjd
X-MBO-RS-ID: f0c29b116a1dbcc3dd0

Remove needless ')'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 .../devicetree/bindings/memory-controllers/renesas,dbsc.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
index 8e3822314b25..30ad2a858844 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
@@ -13,7 +13,7 @@ description: |
   Renesas SoCs contain one or more memory controllers.  These memory
   controllers differ from one SoC variant to another, and are called by
   different names, e.g. "DDR Bus Controller (DBSC)", "DDR3 Bus State Controller
-  (DBSC3)", or "SDRAM Bus State Controller (SBSC)").
+  (DBSC3)", or "SDRAM Bus State Controller (SBSC)".
 
 properties:
   compatible:
-- 
2.54.0

