Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907478;
	b=B8QRxUy7xAu+x2v/49D/o+v+8YTVMt9SsBUcSufrWLcUmfrOYfC3a+gr/TNDfrlI3bIx
	 ZD/fJ1OjcZ/Z/Ty6oNw+11zO6xio2QIKsMySjj0C9nX0dRVk+sSqng6icMCHZ4FUOrliJ
	 UaEs6KBINHmkIXQ12sNfa4dM8dQRNK5q69JTxZXkoBdFx3IJYpr4qRIn3zOyT5n1MkH32
	 K8nGR9I0IToZhNJR9lIp2Eoe2YUMnat0OrFmJPY0PdnXgNpZstDPwrIgx12ytejED46O9
	 0jf/6FbjOC9xC2YZXPj0jTEly5/FOGP5kR++AUTFpx5ho99L7YOv3gvalMcE4XMroHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907478;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=H3d1XA9UCpnKKoHJ1dfdJ5P8iyvP0FbSFRdcuw4Xu4E=;
	b=FTBktaL1mNHALSlqhjxqeHLQl7Zt5IWqg80KHye6GcLj8rLvzn0HpHpb4Ia9OwQAW9O1
	 Os2udTZJTEJ5Pcrzr2G1Y5LDdOBI5AjxMVyFZHShq+6z5E9qvzxNZJx4q8dnfpptCpnQx
	 2Ftc2lGuy7R37IUldJRVJyz6SOEOobj80Wz42ofpx2dZnCoyPih84U3nDht5B5q7tOVSP
	 mui54F2oqAQgFMANaew39iL01IbAGXuy5OC+5W7cRLtOxqyRD8diop/WJRcTRy5gYMpSj
	 w7sXIzjy34n5ljaiBxLgJwEnA4iMvDyrcMuelbn1DOnghciM8HE72DzJLsraUZ+FOiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87046606A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 09:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87046606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AH9OVGU068535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 17:24:31 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 17:24:31 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 17:24:31 +0800
Date: Tue, 17 Nov 2026 17:24:31 +0800
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
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
 <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
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
In-Reply-To: <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AH9OVGU068535

On Fri, Nov 13, 2026 at 01:53:29PM +0000, Conor Dooley wrote:
> > Move the match into soc_is_r9a07g043f() and make it also require
> > ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> > and take the generic Andes cache errata path. No other upstream-
> > supported SoC uses this AX45MP mimpid, so their behavior does not
> > change.
> 
> But a device using this soc that doesn't have a dts in mainline won't
> function properly, so this is fragile. Why not just do it properly and
> check for RZ/Five specifically?
> Can check for of_machine_is_compatible() probably?

I will check for RZ/Five with of_machine_is_compatible("renesas,r9a07g043"),
which on RISC-V is only used by RZ/Five, and drop the marchid/mimpid match.

Thanks,
Mina
