Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266453;
	b=V8DPVh7a0aZ1x0so7XpIMumnzb7VPLxxhzZELW35z6QaWx1Hl4XkShOdY5qUQPcXnMYi
	 VF37WVqRW220fNWg210c7Bq14pisBnXTYm5SJxum2hymTffjiPNC8vNlUlNQ8L4C7NuII
	 sFkXNUkcGX0M0peCNISM2CO/4RGMWy66hVUy+ejp6Scj8cFv85wRWyq1Sv6oVMLKZngc+
	 3HzpbjC0w5ngMk+pZBqqGRysSF+IxP7JLqKCNa4vqaaoBwP5dMnqfmZN+phRk5eq3vKrR
	 KTqzt0jgzmEzQDlJp8qbnrwCdwKMtJ9CooI1TqG6wpsp06NOtxv7dJh58Hnh+ZrvdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266453;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=kc4oDmW8i9mozpJcU9fAYFRzqCZe3WS8+JFCNRvi5+I=;
	b=rsYJx2lu0K4UiKODEmouiYMggqOtUuc5APndzG1Ezfdl7ZZGMolQNajm5aGjLRnsBPAn
	 sL1n+V3ZBd5v8DGBAGPqQkqhomcGDnscVHvJBk01Mfw56I4YnXOXdzIkuCAbrtOfyzS9k
	 ktS3cztoqmJCMzdb/toCN+3CiN5FpBaeJ5f2NYSyGqsMS9vd9C39cdASe/x2QUorjMNg0
	 LCQ+SdsgE4SvsJsEij+doSegQGk0vcoykjSw6g7jzoWuFWzSDEGIxjz77gwbaTh8sJaaM
	 G5RicXNDRawVN20OVYVbEGnXI/UJnJXei6vTugVwaez6V0mmFgEvk++MlBHZlPidlVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E8btDvfl;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A9606A321
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 23:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129A9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E8btDvfl
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id QPJYxNdC1AR1iQYfUxa8Wu; Mon, 09 Nov 2026 23:20:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYfUxodB4SeuLQYfUx8kiJ; Mon, 09 Nov 2026 23:20:52 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af25554
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=37JH_sIDIT6TzvarxRIA:9 a=CjuIK1q_8ugA:10 a=p49Upr6YYhNo69yxWKUU:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kc4oDmW8i9mozpJcU9fAYFRzqCZe3WS8+JFCNRvi5+I=; b=E8btDvfluYKpR6zkKPcc0jUivp
	kDnYfv6Tc5ZseBCm05ZdMtYPt2NFrHAiK9PxjtDtbgnvq9YDyAYWHlC6VwcR5gSTfWOrlxDG0+oPd
	Kq7sSWrGz+XYvaLgT76Gq/NAQ0mmg9nrqJe0aE9uUfRgBWOXOgtgfm/cRo0Okw0X6bdvNUI6Cv61C
	HUZqW7W7rsJRrXXd4GMfbkHSBxHByB67B/fxLgjK2sGsJhQ+uriqjLe+cIA/sRB0jftWLj2QoNc8g
	9rtTvavHA+wnsfrkQgPv8DZcWABl/0h1E3IN2E/+Skzmvv60BGRfpCCMVvGLrYcdoQlbZ8RIKt7BS
	KYHsVOqA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37146 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYfS-00000000vde-1nZf;
	Tue, 10 Nov 2026 04:50:50 +0530
Date: Mon, 9 Nov 2026 15:20:49 -0800
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
Subject: Re: [PATCH v8 3/7] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Message-ID: <bfb40baf-7f33-4f66-ad80-57bef1d6ef1a@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYfS-00000000vde-1nZf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37146
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 48
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOwCDhoIfgQPoaV8UTC2auXcClxiHqgWS67KnjFfPgCWc/GVeX13mO9yEQThN9ekskK8zK5kvv1WI2OGI0j1BXMeG5Agomc+DIEqP/Kwaz+Gl3EquNsR
 BXtPU7quUcR9CHjHWbrFfzq5MMwJOR71tfPWd2rkBcqFIQpGCZu8n9hXezRELB80DAi3iMbIkMIRiNw63E/RbCgP3y3T5lWWm+gyw0uhXGlZJcawWh/kbdVx

On Thu, Oct 01, 2026 at 05:51:57PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> WDTRCR_RSTIRQS is unused, so drop it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter
