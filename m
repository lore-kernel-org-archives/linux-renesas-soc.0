Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885633;
	b=eu1tza65fZkvYD9zWl4Q4/xwqbUDEg+Q0EvywN6B6W+EqXg5VjW9cdsF4aLKqhT58scu
	 7VLKDhNxsb1if/myW0OY8FkEOxGvGj9NWwuyvbeN9hYRdAjh9y5c2qDpcatoHdqqRu6i2
	 fZfgr3VXWe7csOmkfO8YkXKYbGj06a3M1UW1DMUetK2AUf4j15sp5Ekrb71RAEn17JFWT
	 qZNmyynZdFd3ugoEiHlJCoM9j8NQOX4zVh/9YsPRChtZByKpb2bZ6v/Zic/TMpN4G01IB
	 gHWecBQvAMi8cWKOphJIyRJNeL2hZNncV+pHGyAs3N7DueKmaYmQUSgK+sA/JjyY9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885633;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=VcgQojYjPCpv8sowER02XbhBZtVIazUlrZK6d+JWOcQ=;
	b=0Wyn7xotSwviHeGjOe0fUI/4wpi1gGpes8bQnIJ4ui6jNvC7Gh1MwuZcOhqmSb9oAJWb
	 h7WugrRvyqpUSF6lU1lgHqcNtfMR6VTSIkbdqC5E0b7nquaAK6hOYH7uQ1xMWei8nw0wy
	 kR55sNjERpRCgkdbOUbZcZi5Fj9/3zOTvPX6Q0jKYXSXWVP/higg8tZTrI21P3ZbVjBdn
	 P+RdFmV45GqsdxWvwTwVXHweDC6+oacSKM1NmJg2ce90slsXR2wXUP1LbKf8E8QLo04j6
	 JKykM47tvZpOdQmMG4z3OkWGP+Wj14/OYLSLRpZjgl/xepULYJ9J1Z0mwzvuY9JAZpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592C9606A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 03:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 592C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AH3KEFm021723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 11:20:14 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 11:20:14 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 11:20:14 +0800
Date: Tue, 17 Nov 2026 11:20:10 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <avvH6t8NHrya+hz6@atcsi01.andestech.com>
References: <20261116003937.1776888-1-minachou@andestech.com>
 <20261116-dreamless-matador-3163d4abbf0b@spud>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261116-dreamless-matador-3163d4abbf0b@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AH3KEFm021723

On Mon, Nov 16, 2026 at 06:26:33PM +0000, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Mon, 16 Nov 2026 18:26:33 +0000
> From: Conor Dooley <conor@kernel.org>
> To: Mina Hui-Min Chou <minachou@andestech.com>
> Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
>  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
>  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
>  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>  linux-kernel@vger.kernel.org, randolph@andestech.com,
>  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
>  compatible
> 
> On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> > Add the compatible string for the Andes A27L2 CPU core, which is used
> > in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
> > separately by Allwinner.
> 
> I'm going to apply this, on the basis that it will be used elsewhere.
> Ordinarily, it should come with the allwinner series.
> 

Hi Conor,

Got it, thanks for applying it~

Thanks,
Mina


