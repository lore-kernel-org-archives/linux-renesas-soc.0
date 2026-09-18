Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F951CF76
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753586; cv=none; b=obTSqniiYgJf0O4NTAnTGtkqpF2lCOyI5fTnfggu2RWG6ewEztYrr+yyBeg3ReElYZkb5RHnU7vKyQ0G18QazZXw/XL6wcF5MibSELAarZ8Q2L8PEQfKx1lu9Y5sz+c9d0LUEIBzoPprQeGIryn8QHMntooEn7MedWsAFUjLrVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753586; c=relaxed/simple;
	bh=1Xoph9Zzyoz401QMuFQFY0T58m+Pyq3jkWrPk367ZGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9Gi/v2SZiACv21Ff8quOMuFMT4GzB3SS/YhaIZrunU/jyBd2Ej3PEcCYfYUdiBdlM/6Ekik3iDP7EPDBeZu4inY0L72aeRkBqLP6YYmhe2/8cxs39ERX4d1pLWdgLUEgHMn6D5f2fumqUkInm7WuBMlq/tDh2QDiHiiR55HAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHJRl95S; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AuoF8xL6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHJRl95S";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AuoF8xL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789753575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
	b=YHJRl95SRHts1URh8+IxhfvgdhmtPfPXd7xcoCqRw+ZZ1HLF0wgCWi8e2WnaFsr3uIep7W
	guxL2oSIMIV3iLBBfTrIEFNT7RH0UwwYf+50SHi8CRBsZu9qACmDsQR3ppUJJn0eNsHPnk
	rHOdpGCY3aH5VvnMD7Ec3Wo0t5DEz2Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-UubfxfMMOqavfDljZLphVg-1; Fri, 18 Sep 2026 13:46:14 -0400
X-MC-Unique: UubfxfMMOqavfDljZLphVg-1
X-Mimecast-MFC-AGG-ID: UubfxfMMOqavfDljZLphVg_1789753573
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1b824e84so201464185a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789753573; x=1790358373; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
        b=AuoF8xL6YGohyLsL6Ry6L9MUkulMl7VjgaAic2GAelrzxdXyDhkUTGULQj9LJ8lXjC
         HlZlkhPr3he9btHq+BcUjbURcrZ1iVmtBnmFsUHX9O56nLm7N3+2kgsxTOXXz9SQpmVt
         fEzG26bEIBWxtGxZoUd/GUZEYMDMfn0rB8n6xPDn3iSNkG+aaio7rVElPmhBEfe43YPP
         xewzDt1p4WaH37a6JZsQSYv940LRsmC7dzREdWbu0VGWPp4g41/ZDgLirrMAWGbI7Yr3
         A9yVQ+IoDSDN46mKw7o6ziZX3fBsT5ETy+n65fGxciZgB+8SXLpAKsaaArYvfomrcofb
         NXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753573; x=1790358373;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
        b=hJrsmmiajSGhdPE/KO8+kxrq8udYlfhCu1/yOl7grutc63cT/tSquXfCTbzuqy2Wvn
         wF6v4/XZDyBaPmSF8LRW16bOUBgl4gdPrW0NqITauuL8tk80taP4udVA69TxugxRjcIz
         PnDZxdiwFSoHMoH+gbXgnmT3b9Y6VOSBBtCZMrdTEv/fArA8FXkHmxjMEtPe8fvRSRKy
         +jpLE0iCQoUu10vNk+z/CyRxelS/0AsxS0CAsiJfgwxiY5B3KKTrTmOfICo0n2n5E9cK
         0k4xapIGPhoiy2zEk15WdLaak0bDUNj7LgGZwOW8+DpXv9hQb7OD1g/CNQqx95TvW9f8
         rV0A==
X-Forwarded-Encrypted: i=1; AKwUvBxaFxErVOqLZrIu7X0QWeClh1b3BiVXXzzOrMbypOyeRtiLTitlCohvt14Rwy961fRBVqKe3Lb6fm4tQpSKElfpBA==@vger.kernel.org
X-Gm-Message-State: AFuF++kks70EsquLYVVATSn7b+K22pHOd7Hrhg9ZR5ooQjYec8HInXyF
	Pw84ipNJVAcHl8RJKOrZo+fwrGG53ASWM2eTEvavqXJRza+sWowbVh31IgopjBr5+wpd//SfW9a
	3VhlateYd8gIndNXOUplj0wRsBmnrhAlIjJWSoDB9bgJ8LjpPYXAs7qAuvUU7Sy3heqEGiMXo
X-Gm-Gg: AYBFou1MwvT1DVP1o23j4IRLsiU1u1m8BFg0405sfXgPf5sSHkeKi0Ag8G0wSj36wqD
	qJ3ocEjK12K/jSv0So7AlwkJRf79qkjm2h+eE8sskd/9kSYz7qofGsmcSiCDNkoQrzP+zVStfOI
	8U6eyxVCOk1IcDkJ+X+xv0nUSukW/Q4PQkKyBh4fYTcw3dfwsQ6tvRWWtGDYcLLGEN9XUzpwb2x
	shawN8fjnzRknOL20K8K5k1atHpIhiUdxxfv9vYWl5tj5md8Rqjt95cO86r4X0HfzkSj7b23amr
	drC8GL/3x585ZzRuTd6xx1t7PTZKcTPMud/ppes6Xuu37BrhwUXV/926UD95vadLXJJRo8vvwWC
	vo1MeGlnQWEPLvccbU/vqLyonC+kyzp5IydQ=
X-Received: by 2002:a05:620a:1a07:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93bdc6e5bdamr470098085a.27.1789753573463;
        Fri, 18 Sep 2026 10:46:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93bdc6e5bdamr470095285a.27.1789753573025;
        Fri, 18 Sep 2026 10:46:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e56a03sm192582085a.16.2026.09.18.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:46:12 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:46:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.4
Message-ID: <aq1443hvruNPF2ll@redhat.com>
References: <cover.1789723268.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1789723268.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Sep 18, 2026 at 11:37:46AM +0200, Geert Uytterhoeven wrote:
> 	Hi Stephen, Brian, Jérome,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag1
> 
> for you to fetch changes up to 8d90c0eeef104553d6b9137becd7f58b468aaa0b:
> 
>   clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v7.4
> 
>   - Add display and PCIe clocks and resets on RZ/G3L,
>   - Make sure clk_init_data is fully initialized,
>   - Convert RZ/V2H to the clk_hw-based provider API,
>   - Add syscon regmap support for the System Controller (SYSC) on RZ/T2H
>     and RZ/N2H,
>   - Miscellaneous fixes and improvements.
> 
> Thanks for pulling!

Merged into clk-next.

Brian

