Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738F2E63C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777859; cv=none; b=XXAkVPy42mJWZaebyaTu0jH3zqTkQQ7QbjbevaSRXvTCCM5Zlz9QBoSCcaENDZMR83kxwGLoIZYNPw+mbq9g21+hZdm5Rd8zJsylb7znt9yxTeTvjPUHZRIfkocVKlCz+RzJQRSIngWqlxqNXPSGiVxbBKME5i6A22Y1hht0/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777859; c=relaxed/simple;
	bh=hnCEjxEoyCRc6YRnLqjmPsAGg18o4fGe1jTNrnPpxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJwD2rvTLuy08b0AGZeSVMWEOGwuvIAFPSL8IqaGvjUcKZ0Qsifqsh5kRhkBX+6cTwF0xQxOK3j1w/w8VxovQLGadYP1t8KFH+YoK3ijaRBVy6gr8xEXnD/mG3GVY3qmPHx8wiDgS7ndqLMY4EADxYXytlxa8hcegT0k3C2v2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rWXIJDpq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rWXIJDpq"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3753298A;
	Tue, 17 Mar 2026 21:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773777783;
	bh=hnCEjxEoyCRc6YRnLqjmPsAGg18o4fGe1jTNrnPpxMo=;
	h=From:To:Cc:Subject:Date:From;
	b=rWXIJDpqsnujvlkJK1ckBDwTYxhnW23KKLtOQEznmx/eegrIaB6ic8cPOn28eT7Dm
	 Htv2+oDLKC84FSA0WXXk/N1MWcAMuwZ2B87d7h5eVF/RsNd28Toh6FixQwKvmNS0DD
	 EllvPvSrGSibWH5ieeaOSy+s1uxXmYchhVjNq4ac=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH 0/2] Miscellaneous fixes
Date: Tue, 17 Mar 2026 22:04:11 +0200
Message-ID: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small series fixes two issues with the vsp-tests. Patch 1/2 is a
small cleanup, while patch 2/2 fixes tests with newer versions of
ImageMagick.

Laurent Pinchart (2):
  vsp-lib: Drop unused variable
  vsp-lib: Support newer versions of ImageMagick

 scripts/vsp-lib.sh | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)


base-commit: f1327dc9a2cfaf3577ca30334e161e5e35ef5651
-- 
Regards,

Laurent Pinchart

