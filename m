Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910328;
	b=Z7KVJpkEC8qyZsmNRDfnxRyfKbI9RiBeQ0TQTe1g8PHpvX4W3DNJbPcrXnwdiwQK7WRr
	 It06BT4CvmmDQFjUYrjJsBzA9VKVcl4mAbV4DkD/Ez1ixc9v62CAR5TnFhd/5spDYkGYC
	 TjQeCOO9GnY0kE0hESL6zFn4mjoF+BVP8GWtiTCqUKRDuekr2vTtYZCTDNG00CU1/Ewbs
	 fj+0Yzhwg4lZLY6Nau5zoP+dIUvzL6IxWJvkAprtOUCCE/N4dEU8UyZUCpqNyWr/+SB1U
	 vffxLOlUtWyTPS/Dey4VpNtp5BOG9Hir6YkKSiIsllsSLLro/1b1ha4p7ppFi4fBLqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910328;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=hd3lpnNdLx+PWPEPuMz+oaXos4GCD/A0WeAPGnkcYEA=;
	b=q1pFQimmwPA0y//AmkU4SrIBsG958rEvN2RoE2ene5vOmJJ9r5cRs5NC2TytSxeOilqH
	 nHMN8z7aOUORhs/HoHrcz31f5KSRatvya3TSOLPdSRJSlyVh0l3d2242AzxT9c6iLIZCh
	 2QLbuJo41ilhvyg9+kvbatMPD0/gVbaYrxLG24+UeQgn1bpwapImRc9wMQwB4oABPNj9S
	 PlkArRnxczPi6s0H05d9TVPSKezpafmS3JrG9l9J9r+b3g37nGgcPn5rw4tYYr7z+kM50
	 txINZVXLm4/nBs+FiW/pLc8sdVwEq4xueE/kWxZXjSPx2pOwPjVfL+pcNb/SdHPspaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2BD606A31C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 10:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AHABtbI090783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 18:11:55 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 18:11:55 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 18:11:55 +0800
Date: Tue, 17 Nov 2026 18:11:55 +0800
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
Subject: Re: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata
 for Andes cores
Message-ID: <avwoa/UDFV8iKG11@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-18-minachou@andestech.com>
 <20261113-voice-pledge-d0b4e1420676@spud>
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
In-Reply-To: <20261113-voice-pledge-d0b4e1420676@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AHABtbI090783

On Fri, Nov 13, 2026 at 01:59:11PM +0000, Conor Dooley wrote:
> > -static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
> > +static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
> 
> Just call it probe so that you dont rename it again when the next
> erratum shows up?
> 

Thanks for the suggestion, I'll give it a more generic name.

> >  {
> >  	static bool done;
> >  
> > @@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
> >  
> >  	done = true;
> >  
> > -	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
> > -		return;
> > -
> > -	if (!ax45mp_iocp_sw_workaround())
> > +	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
> > +		if (!ax45mp_iocp_sw_workaround())
> > +			return;
> > +	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
> >  		return;
> > +	}
> 
> Is this correct? The code goes on to always mark noncoherent stuff
> supported, so this means that every andes device must then support
> noncoherent. The commit message's wording isn't that strong.
> 

Yes, this is intended. IOCP is configurable on Andes cores: a core
either has no IOCP, or has IOCP that the SoC can enable or disable
(RZ/Five, for example, disables it). As this is up to each SoC, we
would rather not check it for every core and configuration, so the
errata marks non-coherent DMA as supported on every Andes core without
Zicbom.

This does not make any device non-coherent: a device is still coherent
unless the devicetree marks it dma-noncoherent, and the CCTL cache ops
are only registered when the devicetree has the LLC node.

I will make this explicit in the commit message.

> >  
> >  	/* Set this just to make core cbo code happy */
> 
> This comment is no longer accurate because you gave this value special
> meaning elsewhere in the series.
> That patch needs to change this comment.
> 
> Cheers,
> Conor.
> 

I will update the comment in the patch that gives this value its meaning.

Thanks,
Mina
