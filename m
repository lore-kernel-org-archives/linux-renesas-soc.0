Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB830FF20
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399036; cv=none; b=K+vkKb/sjndBxAY+3K/xuGKUTKuXT9p67Xc511PdDR9yrVnNyjDSJUAYMApR+uM57L5jvqEFIO+j8I/GnmjEKd6UFMNbxc5wYsZSyNpYpveMsrfMapl5hNnl10NmTjh7U8RGfaT1WMcYW4qHY79URyF5Ia9IF/+PGXuyNHPbBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399036; c=relaxed/simple;
	bh=AJeIM6L6k9xlH6uEIbG80n9uUhMiXDl8KKP64JsfVxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVomxw9iY9DYGS1x29LFL1P1mgmMBA2NYNS7IRQfjNBBVC6JkfJ+5dJ0XsS7J1yUTkNmxMe8IwE+c3AneXYPKIogp3An8dUGodjAdV6aZ8U+moBkUIQl2TmhWlO/a0k4GoQKfy1FJzYx6Wcvabhna6RCQlFA2YEmz9fy0If3frM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XLvjcWIx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XLvjcWIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AJeI
	M6L6k9xlH6uEIbG80n9uUhMiXDl8KKP64JsfVxY=; b=XLvjcWIxLFF7kv7LYmho
	ZHm0UZIYyXC4xbSomkDrZwuBY8Vy3jJFs0mH9LuA5NFHJmipiYu/WShAYcS1PUkf
	Wi2q7FwQzefAwaGXx8ahPxIIpHwKJOfKmiV/gfcFphbGJjS5tkMPK59mUZijK8zl
	r3f/BNN/kV0FgqmzqMXFvc2NPD+p2EeRghLli5ZtOJUhwXB5RL8M81Y1z0dqPMxO
	6+ujz3D1KWZ5cn8Xtrxg+xs+pQI254QyDPZ2Vd5j4IMguBbcJpmtgK2HP0NWtDXu
	ze8KcJa+a0Xt3gVAuAZ+sgK0sxTc9c5sNwL/fu8OwN3WjGBjeLA3J8TEW6nFW7eV
	CA==
Received: (qmail 1820937 invoked from network); 18 Jul 2026 20:23:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2026 20:23:48 +0200
X-UD-Smtp-Session: l3s3148p1@zU45xuZW3uEujnu6
Date: Sat, 18 Jul 2026 20:23:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] soc: renesas: mfis: add hwspinlock support
Message-ID: <alvEsdM_JCX9kflk@ninjato>
References: <20260618164905.18547-1-wsa+renesas@sang-engineering.com>
 <ajTqarh55OZgSBsI@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="faTW1spUOegqFoK8"
Content-Disposition: inline
In-Reply-To: <ajTqarh55OZgSBsI@shikoro>


--faTW1spUOegqFoK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The spinlock was a best effort thing at the time. It should be a
> hwspinlock even to protect against accesses from non-AP cores. I thought
> this could be postponed to later, but it seems it cannot.

Then again, hwspinlock core seems to need more updates until we can
finally do that. I'll use the raw_spinlock as an intermediate step.


--faTW1spUOegqFoK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpbxK0ACgkQFA3kzBSg
KbaOfBAAmnYDpA0YbY17EmqxvfP21AEDF0NQymGlBChWmfE16oYcPdzZ9amO8w4Q
G048earXyfaRfnmPvqpsjrYLv5tL1czdlK3gnqrGp+ZJ6Z8nobRrLJcmnVp18oEa
3tdq00Y/jebxVRkkhkgjL99JhYkd5wSYUwi5U/gbcXkwkhnETKvzyzskoEgVHSkH
EwYweGit9Y+h3NgbHWux7m8r0WQfIFya0qtPhswszWAdJ8VbEvsTMNkejoIKcCn7
Cd5zNlP6/wvYCDIuvcFAyTKDq99sLk0KN2uDnznN04H7KO/JtGr89UAdCg67AnMr
fKctguFUe6mrtVjXj+YhkwviFd0eHL1cziUt9mdvsewD/5N7jcWQ+InzbMJCkis2
20QYE0LOBzUM+QnHRtNkgFSWU3Sv/an152KFISGOmC0M7sQnoPtLmb90+b5XZaCN
dcB0Yu3x9KY3kH8I7jazhNiNKFJJ6vFAD6AiS2JWYUwC0bgwrVSH4evrlOHxh+2k
5O4ia381nQh5mqpcsXOd9XEhFMKbdtcdhLGRYoRAfq5KNw7i+krCsVR/rV8/H2Ju
pdpyBD1gR5oYcxnOijSV7E5nSnsdjgTzeGgEgmCkYcHVSkTaN39f9zHpzO3UV54s
aF/RkxIe5sl2HRDcJWwsFEMsrk7KGkLF6TDkdK+oSJc4+tGGtIg=
=JIQm
-----END PGP SIGNATURE-----

--faTW1spUOegqFoK8--
