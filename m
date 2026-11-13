Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600073;
	b=FzlTtW6PAFrOSLUGfuzrll+uM22k70YxcqVUSRo8lFRVVNeK55+uQAgdEFxJn0/NDvD7
	 9CLHamxDqidiQzEwcqKhpLXbAZu1z7WpghLvNcXtxtm7LWHXTthuHItZMYQBtLfSqPDwC
	 6b8Sn9aA3qP3/AQpJ+krFSarIf+Y/0RX0VcSHjs26+gY2XGkm3WxGJNzZQIIwcBK3x74k
	 RAwoELEwKECbYnTPC6qk0AYTxeLWmUwuV9mcLr2iBwn33qSX5ZswoY1eKVFESKQq9sEIv
	 pWzHsQmDik6lQbRAoWedVujcNTRXtcao6u66IA3OoFxfX99jFgOc682g5JSTEPzBDdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600073;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aLumz5CHjOJTllo97qgVcnqY9y2ht9c0L800dC3uAtQ=;
	b=uziU+4JQY+Fgzn1DH7A6aqh2QmdYJqZoEN0JHjySxKwOQOKxWpTW2vXttd1AKSUz5+2K
	 w92gBqR32LMJ4foJxu+gG55WjG2Wmbxm0NHfU5nN+vRASQubFTGZEifA/rxBm3/9OCTUE
	 9Ckzqi4La/mklrxqDC4y33gwYIuZc//0Oipi15fUZqBStRpaQWLa+mRYUPdlfN0F8ByvX
	 pRDxGEFbrCmR/GFMck4LZmdK5ltdTszjRRROaTAoEMHO5EHlYqxYAnBBuO+9XZ+enfwl4
	 MQ3b4ySB+WcnYV3oA7LGPKJNygGqUukzMmGYGaiSK24thpwuYdug96gAiACy6WdfplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=X0io3Ygf;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934D1606AE87
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 20:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934D1606AE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=X0io3Ygf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aLum
	z5CHjOJTllo97qgVcnqY9y2ht9c0L800dC3uAtQ=; b=X0io3YgfB141+Z5RXvbU
	a6Hh228LbvqcyoDEnE7oULDbMrb8F/Bwok0xAcmMwATLrRhMbfOEWW6WsVjr+WhC
	4XbKvH8deshYKS9sI0Mae7xHHiv2HvY031n8bUP8SU4H/aEYUtfW4KYqfzwf20GS
	PzV/mdinm8eT2hIOrftuumjaeanHf2oStXe0UHdpKVqhzImA/R/pnGyOfLWkFcub
	mGc0dQ/2QhlF5qebLDbimUuRi0ILu7g7eGEYMlIF7LXx01AwOulRIsmh3hRTh4/2
	829Gz+sYCPG3FjSzQKPlGGCtpqQYo7ZJ2OYGATv0EgDQwPDpUwtEyXYVAq2jI++8
	vg==
Received: (qmail 350957 invoked from network); 13 Nov 2026 21:01:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2026 21:01:01 +0100
X-UD-Smtp-Session: l3s3148p1@qY4m4y1gcJIujntX
Date: Fri, 13 Nov 2026 21:01:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
Message-ID: <avdsfFHl1Eoj-2i1@shikoro>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>

On Fri, Nov 13, 2026 at 11:14:52AM -0700, James Hilliard wrote:
> Keep chip metadata and controller storage alive until the final MTD
> reference is released. Unregister and disconnect each published chip
> before releasing the resources used by its hardware operations.
> 
> Disconnect all chips before dropping runtime PM and transfer buffers.
> 
> Run NAND cleanup during disconnection; the final core-owned put only
> releases retained allocation and layout data.
> 
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

From what I understood from the coverletter, this seems valid.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Miquel: can you test it? My RZ/N1 board doesn't have NAND.
