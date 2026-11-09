Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266551;
	b=ovL/e0APIfbjtISD+cS6o82rZFCXtrlgwLSNoL00f96IkYzU0kC67nwBvuv1jaNq0mWW
	 93K5N2iblaNHTg2pnKulmJNttlr5VHeIjlamjzVumR09jQ4PQoKGJRORaWA8fJBUNSC4s
	 X2pntP7EHfbFb8RJQ+5mmsgGggTXSH5gJadJFT29Q9MYSE8ciPucXjecUr7bwvnSRHYb6
	 4kcL8HVOhjjSbB8i7ndAET2/H27aDyYy26ZVdEn++9FuePJHXU+JeY6SDpKtrVnMHnAU4
	 oYLv9I2y/ly6y3BFJsa/RA4B2ancDQSCG8GM82t83DbjGMHTeQbNnWKiYoqw31KOwcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266551;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=W+XCy+nVFnxoDmQzBQ0c9S90ITTeoRgfFYCLUSeMDj4=;
	b=sW5TQQ/xjtm2fEJJS+v0+rVgELwH79PwJluUgv8e0g5xYefhFmP9W/bHjCY8MADuipMw
	 FLu3jtel++sltoOAkxMl8jh0gphBCvPRACziPKTHICDibwYE6iDTpdyQLd8gGZf4NnKA9
	 Uq0R9H5ExS+FXCPSwM0U3UGi4nwSlm8cECAjky0TKYF+Pt5ZKRFa0x4Xs/ZT04eR5MaZK
	 4pvdPusLeiNXXVsNbBY8EaGO+DcDgMXdlyvXQS+1vVqoU68qDqmn1fVuLxKmOddC9VgtY
	 jQDrL0IrQcp/5irYLrTK7KgMgkMD99eTHgaVSIsgU84umcoqj7beEvFBXOcsQ/tAC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J8jHts4v;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4F606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 23:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J8jHts4v
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id QUfzxCfd0yb4YQYh4xpotx; Mon, 09 Nov 2026 23:22:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYh3xofoHSeuLQYh4x8n2h; Mon, 09 Nov 2026 23:22:30 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af255b6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=C-G3OIpCgmwuh2f8opQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=p49Upr6YYhNo69yxWKUU:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W+XCy+nVFnxoDmQzBQ0c9S90ITTeoRgfFYCLUSeMDj4=; b=J8jHts4vEOuUy2HxMIwZKAr89F
	h1cbBtZbq6Gt3UIU3q3O7RuBAJQWl4JrWWyDT8FYKnkBSx99VbSNTnLFXvUbu/h5zsj7ra5xv9s6d
	jthFhamylcg5cMTS7Tj1KIJZ3kEWBTIQq98t9tJPrgymVHqO3w9YdIvH0OTL7nzgGS+Tf1j7b5pw9
	mYC0ueLeWc+WMUWo0rB+5LYVVIA4ONfkz4jrYdfyUcfiibgd8+f5bqFbqjkK5vWVWH/Ua3iCKgRL6
	7Tl3RBBoCQlwU2lzguXEJ3WApPcKswiIHpfzF+ucRG8Wjw1eYfELs4S3hb2ag1ym99QGCTg2l6Mn1
	32akXeHg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55034 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYh3-00000000wME-05ni;
	Tue, 10 Nov 2026 04:52:29 +0530
Date: Mon, 9 Nov 2026 15:22:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 4/7] watchdog: rzv2h: Drop runtime PM handling from
 WDTDCR init
Message-ID: <0ae129cf-87df-4d26-8d2f-0c54c09d4019@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYh3-00000000wME-05ni
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55034
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 68
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOBXkLQoEgjFLECzm7ryoENOlO+8xRy57BClnmLTKWpssgh1JjZhExmATno3HCHygWHS9XX6JNrGuW+ydVLEvt/61L2l5yC22lFVThaMTCkkR3ztFugu
 RqoPRsP5LKCtBzclA4apQJZt8pUWPwtjd550b4rUZS87S8KNqibXv4WFPUer5q75pCRX0OS4MAK5HOaYUV292oHza9Lv5DlF7JtiJ08IvFLjQ7kbOi5lkFFu

On Thu, Oct 01, 2026 at 05:51:58PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> WDTDCR is located in the CPG region, outside the watchdog module, and is
> accessible regardless of the watchdog's clocks and reset state.
> 
> Drop the unnecessary runtime PM handling from WDTDCR initialization and
> access the register directly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter
