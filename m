Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CAC3659F3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849315; cv=none; b=JjX1nxqx9flfLiZ9stMOofN6X6LXsKzxxD3GLxGUOdrA2wRp7g3ILvQOsdVL1DzAYuXJXxqI8kwzC1NUc4/9NEl3UJV5EWhqQyhe+ENBRl1DQFjDuj5OOTovm5xfV5gUf9LfSRxU5aQg+2Bk2LEORVUQkqzVdKA8QaMVitSYsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849315; c=relaxed/simple;
	bh=W2xlc0kVachnzMcCAj6crN5NdOa4lMux5dd4AI6WS1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3QEkS0yDdUoan0V3gUgn7Ivn6Ef++zCHxdaFDa3hg1sNTuEb9odLXDI7PcFeVeXNuYdCiMa7Z0aQINFfXOIwkm7+45jUw3XblJIZR1mA4VncQ6cvIpZwkc7RjgZIrsFrzVvaMJhcBjcfZZaeIx+/cq41IAaBkr8iS3qgXHlPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XAC1cP9u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XAC1cP9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=TOmw4XZFjcs4Zn
	uaQVoGdo6zojxb7iYdvE01sM2dxW8=; b=XAC1cP9uVkBPNzaATK+N4yMoKCoKCu
	GNuijRl8qo7r7d6xoXaTKOW2j4fHLPLjTUHT+eZxzQpck1gN5kfs6xF+mGGq0Qin
	ZZo1jdaY+NcNNJL9rBB2Zld2KJ8yq6KjRWjftukGSk9hJlxzX+tZwjk5mgW1P3nB
	IwouSk211ANim4PseLqBu9Zt4PxSjqA8fBi5jaQlIooJ8Xxd6hU8Mpfq/HKgK6G7
	KngWnB24l82HV2XtCZ0gj8nLeS9ElzmNAy3Ijy5GeifTm3W27XJfVmaG152AFdgQ
	tdmBy+63wtQUkr96HhkMIHys7wXS0PjN0Bp0RBnW18ekuHGFthmwWLXw==
Received: (qmail 2304004 invoked from network); 23 Feb 2026 13:21:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2026 13:21:41 +0100
X-UD-Smtp-Session: l3s3148p1@3SIx0HxLToIgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: correct kdoc title for mbox_bind_client
Date: Mon, 23 Feb 2026 13:21:33 +0100
Message-ID: <20260223122132.7435-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Request" is wrong, there is a separate function for requesting. This
functions binds, so describe this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 617ba505691d..e63b2292ee7a 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -341,7 +341,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 }
 
 /**
- * mbox_bind_client - Request a mailbox channel.
+ * mbox_bind_client - Bind client to a mailbox channel.
  * @chan: The mailbox channel to bind the client to.
  * @cl: Identity of the client requesting the channel.
  *
-- 
2.51.0

