Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467637A487
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411766; cv=none; b=cA+zL68LKneujRdycmQzuNWEifXYSDEd/mk3saHv3oI6kSd845H4ek8hT9Fn3Cvv6uvFjN+Ps2WFjE4Q/fsW65gCIJExxmLTwNXNtmTjA+4hqcZNqxHrVwismb4Pmg8ALUJPKjqX3oDgafZdo+xEVuw+N2fMFe1HNikyKkvfimQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411766; c=relaxed/simple;
	bh=Avqf+kr4nngRSCNdr+yAxqRremxkVuaxBwqyuD+QZxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvaVcX4IflgFbVwjwyFLxidT7bSqR+slwFqADDXRr+XVbJBx5K0C5VtooVX/2XLk00aFU6aU9Nzz0Y+RIeGt9xxtlcnreYeIgykaHwo24zwOZs58Zd1AA16elYvyFAamghX2qSxJYVivOZKLmY7IFzMuSQg8O5D62q+30CXYiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=azIff4y2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="azIff4y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rnj68BX23q+3gr
	ugojzLCa+AaeaxY09VUmQCa1M1rYQ=; b=azIff4y2iBU20dFZdLswj0caa9DQnO
	0WIE/9sbPgdRif/keZl0MHXkpKyci+dMeF03eLPm2pvjuWudpZm6mzT8zvaUpNQn
	Keq9CBItICelz3FgXDghgoIg1zMZ3cYtNC0q5Pp3gngKRNTr/z632JvtFJAMkdbZ
	2G6wfMgblUf9rXxo0VrCyqHcxJVm/zmWgFFQjdywGX2OAgphaORVSB2dzKYPJf9c
	2tU6Hc3x/PoE6RyhcGhzzcfZytnXkqmidSpsVD+/5XeJJZrx1XRRI2qaSt2hU8ej
	zqlexE4RXxeBuOUltoWDtHPxKq9yy/TwCBd8A7yCgAINKuME4b5G1IUA==
Received: (qmail 3855903 invoked from network); 17 Apr 2026 09:42:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:39 +0200
X-UD-Smtp-Session: l3s3148p1@j5reF6NPWyhtKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 0/4] mailbox: mailbox-test: fix issues reported by Sashiko
Date: Fri, 17 Apr 2026 09:42:32 +0200
Message-ID: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
* added tag to patch 1 (Thanks, Geert!)
* fixed 'workqueue' typo in commit message to 'waitqueue'
* added patch 4

There were some more comments to my v1 patch series from Sashiko[1] but
I will leave it here. I don't use signals so far, so I'll leave that
part for someone else. And the rest of the comments are somehow valid
but keeping in mind that this is a debug driver only, some compromises
can be made. The patches here are worth fixing, though, IMO.

Tested with a Renesas Ironhide board (R-Car X5H).

[1] https://sashiko.dev/#/patchset/20260416114737.36988-1-wsa%2Brenesas%40sang-engineering.com

Wolfram Sang (4):
  mailbox: mailbox-test: handle channel errors consistently
  mailbox: mailbox-test: don't free the reused channel
  mailbox: mailbox-test: initialize struct earlier
  mailbox: mailbox-test: make data_ready a per-instance variable

 drivers/mailbox/mailbox-test.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

-- 
2.51.0

