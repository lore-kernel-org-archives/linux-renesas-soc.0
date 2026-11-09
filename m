Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266217;
	b=0xJYlbMj+Dlqga926qMu3Ngqmzv2EXokIYpqnC/ZrjDqTSi0J3oIehUh8+AO1oi/W4TG
	 qLJnYeOtBzGxI2+zNjGwxaYH15M8vENAbRndCgU7jCWLssjBowLW5qoUUZrWjUyez46aQ
	 uJzVh6p95nYRAraskX/Q+Q7D5hkQ+VzYHjBOgbJAZLOIDIkQnctucDhgt5MogGDZq69Gl
	 yLlHenFund3UFFrXxv0fIm5rwr5vlZGYlndc1wO57POAjc+ZTz7Jinc/dCP4IvE3pcrNr
	 lAyNtKmJhhoM04Mg35X1zK7oEwztaHZMp0YYxQJed+RlMoucncmVVGeJ/1nTWx2B7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266217;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ourNGXvQ5Ub4aFSYZr4GTp+31ZYMvfjzPnbWU36+4JY=;
	b=eeH3Z6CKwSJBbez7aoa7wCjzC/wRbSHpjPNqIbFBLDlwCMQJDHYFtIHc33JG0qc1Wkv7
	 uUqjNCX1/SKDmef5bxrrPG/Pjn792XCZF2FgpJEIBU1h6dx4JV8adnLSw89p5u7qdwgZ+
	 c8XhjgEFJ/NS4E6kkWo350z25TTlE77GLFsISTiQwCkfqa3eSwfjaGMZOQCnrHE05I9yY
	 zXt85nCu1DNBBfCkH6eSAoPzFKBOsMc1ACnV44D618kJ7jPxUPyUOKHWF293yWAd8PMxt
	 OAKUtMjTzqZdFELPE0J6aGqGe5K6siRVKSMK/tgP2KPYHzejkwHf4AzVSKu3sqAXy5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g8OM+qIh;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD1606A32A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 23:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g8OM+qIh
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id QXKdxrSru4vCDQYbgxCM3j; Mon, 09 Nov 2026 23:16:56 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYbfxpqhpSgq1QYbfxeQCA; Mon, 09 Nov 2026 23:16:55 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af25467
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=GU2OR-2u3yUetoAu5r4A:9 a=CjuIK1q_8ugA:10 a=p49Upr6YYhNo69yxWKUU:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ourNGXvQ5Ub4aFSYZr4GTp+31ZYMvfjzPnbWU36+4JY=; b=g8OM+qIh4P8JuAXOofLquteH9V
	GA8GU+WHHy5ORMPSZWQXI2f2OHpxFOrmM6ExzkPpZDlo/xKgsF+FSDcJttYpKH6NowrZpbtzzGyzT
	D99Mj8eK3o8LtpxJHBQzwEKYH7KBe8tYLPJQ/7yQ22xZfiIRmrqJzNAIckR50HsbtEZfVR7puSGZu
	M3Pq6DIFGUP/dou1iJq4r4TPSNeRgBe32TRDERfdkm+KaAGOWtmjKLSxghGkwKkH8v2Mv4QSDT8zc
	1PY3Z99s2mFe0WYa9TvLqjk+UoN3SvAvVYe3ALxd0NIof43zNhrR0jircdZTB5idKxqkRG0rtyNe9
	UR1ibrIA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47824 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYbd-00000000tOY-3UMs;
	Tue, 10 Nov 2026 04:46:53 +0530
Date: Mon, 9 Nov 2026 15:16:52 -0800
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
Subject: Re: [PATCH v8 2/7] watchdog: rzv2h: Use pm_runtime_put_sync()
Message-ID: <36f3db86-774e-4e38-9216-a5af7ccbf6a5@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYbd-00000000tOY-3UMs
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:47824
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 28
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKv9RcSnxXF5biwHuVMY4CpGfUaU1j6P/hmS12S7IC1Gnc0iGacLWefxHjHiC/o1Txfphy3m2eYDVZs094g4AU7elE+p1I9qJymg0trA+ddN+xXA+C5F
 vNFLbQDCOfq2C26r51ZHHagO03A1IWDKOnBZbLCJI/dzhsnMlvFs9J30xggNuWoFSOA/AztMDIMpBXy/3+p4UH2su2liELEgF4qjiESCjy4XX8H4B0Dg7VML

On Thu, Oct 01, 2026 at 05:51:56PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> pm_runtime_put() may trigger the idle check after pm_runtime_disable()
> is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
> runtime PM active.
> 
> Use pm_runtime_put_sync() to ensure the idle check runs synchronously.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter
