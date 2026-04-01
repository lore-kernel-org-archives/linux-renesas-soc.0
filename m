Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF2935F5F3;
	Wed,  1 Apr 2026 02:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010739; cv=none; b=soYbhQy5MovVqZGmaErNcCByfIbMUo+RwzimIU3qgMZpxKMPcv3Bee2eLzlwnrYURGrbYvCSu9Dx3slq+jlT84vUP3BgsyX58qjFbzdl9oTEJcENMRGVp67GEH9G8talv5Oz0NXu4V0QWwHa9OgegbpeIFaoFT9LAxq0U17uBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010739; c=relaxed/simple;
	bh=PgQgToJGk1WzmWzaimAGdPpQWYyqbDvyJ3RIEPsph2o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXpNvJtuHhznI9RYD6Nb6xsj7hYFf+EGNzTFmb4VWZX+FEPulPmLe99guYHYmbs0NvMMkLpq1cak0qqFE0J45ZNgAhQarJRb0YEmxtmwd4Vg7+2IAmjZplJyEG/I+myLyTGazNLn5paDl8CjY9ExCONffiYpPKblC6oGzp4W96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 6312UmNv071240;
	Wed, 1 Apr 2026 10:30:48 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Apr
 2026 10:30:48 +0800
Date: Wed, 1 Apr 2026 10:30:41 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for
 generic Andes platform support
Message-ID: <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-2-minachou@andestech.com>
 <20260330-oxford-chevy-5f5a6f0a5be4@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260330-oxford-chevy-5f5a6f0a5be4@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6312UmNv071240

Thank you both, Krzysztof and Conor, for the detailed review.
I appreciate the feedback and admit this series needed more work
before sending. I will address all the issues in the next version.
 
A bit of background on the motivation: the main goal of this series
was to prepare the Andes cache driver for a SoC Allwinner Avaotaf1 V821,
which uses the Andes A27L2 CPU. We wanted to share a single cache driver
across different Andes CPU variants, which is why we tried to move toward
more generic naming in both the driver and the compatible strings.
 
We have two questions we'd appreciate guidance on:
  a) On compatible string naming: We'll drop patch [5/7][6/7] and won't
     rename any existing compatible strings. But we'd like to confirm
     the preferred approach for A27L2: would it be acceptable to add
     a generic compatible (andestech,andes-llcache) as an addition?
     If so, would a CPU-specific compatible (andestech,a27l2-cache)
     still be required alongside it?
 
  b) On Avaotaf1 V821 support: We are not in a position to submit the
     DTS on behalf of Allwinner. However, we would like to add the
     corresponding compatible strings to the existing binding
     documents (andestech,andes-llcache.yaml, sifive,plic-1.0.0.yaml,
     and riscv/cpus.yaml) in advance, so that the bindings are ready
     when Allwinner eventually submits their DTS.
     Would it be acceptable to upstream binding-only changes without
     an accompanying DTS at this stage?
 
For the next version, we're thinking of keeping only the changes
needed to generalize the cache driver, and dropping the improvements
for now to keep things focused. If you have any suggestion on how
to approach this, we'd love to hear it.
 
Thanks again for your patience.
 
Best regards,
Mina
