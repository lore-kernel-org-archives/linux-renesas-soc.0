Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069C3BB126
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957388; cv=none; b=SSJQyUJ2htkhZs4TApzjB9tZqX5hFpr/xb/2wq6bMqZWUFg8j0HbdMbVFSm55t70qhy1BcX1RL/0hrn/ET3TEiL7UIs2/74yD8t0LcNgmpyiMuSE9lahmGtOuifX3SyiWQLoriHb8xPzFVJ4cln3Wh4Wbz36sTQlNJR8LDxnVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957388; c=relaxed/simple;
	bh=Ctm073Bj7e2ZLjn3SSoFUwpRQr+8cC9o7LCyjPJVWhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X68B/TVwuPHQGv5b2g23/GIgou5RIYZfikgFailFiQ/pfB9SMEuw/Xav4uyAaf/Jk1AUUBj/JpYTklBzAAkNL3WO8H+qt/SUlwWg56U/r7++jp8HbZ71S+778yzAbx4E137owPav9kUPgfMNjy+3Buci4TuhTcpUVjldgTC7mmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DTt/QPWI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DTt/QPWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ctm0
	73Bj7e2ZLjn3SSoFUwpRQr+8cC9o7LCyjPJVWhE=; b=DTt/QPWIhPSB3YihO9GB
	0O5kcPgYoiKvE/qgOX36RrKgLnT2IF41Um/T3IKDxHQRYwHZqt4cmWPHIZiiQGqU
	TLYFN7uV+NuK73f6YxEeZhUJz2yTaxR0UsM5xwDMQ2aB8GFki59Ltv87MgjHp/lk
	tD/s+LDkrHiO93r0sHA7z6mRw87IrQf+y12/UA76QsWQiOERd0xv+8CH980kebje
	s5o+/U2FTmPpwXWDwFWnP9nXUdr6mEMwF7rX1lnL5Jp3bGpKeHHsoUjU7vnzB5Pn
	GFtnhOZgUvLhkodruP76X0dzJ1xaWfYtXLsC+vwLxLwx46fBmcXE30RhevJY9bc0
	wQ==
Received: (qmail 3396681 invoked from network); 17 Aug 2026 11:03:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2026 11:03:03 +0200
X-UD-Smtp-Session: l3s3148p1@zt4KcDpZ2Owujnve
Date: Mon, 17 Aug 2026 11:03:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v6 0/3] hwspinlock: convert to XArray and add debug
 capabilities
Message-ID: <aoLORmmx8OOSQwlZ@ninjato>
References: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
 <amc0jR2yH3ia6ZgZ@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amc0jR2yH3ia6ZgZ@ninjato>


> From my side, this series is good to go. Looking forward to other
> comments, of course!

So, it seems this didn't make it into the 7.3 merge window. Anything
this series needs?

