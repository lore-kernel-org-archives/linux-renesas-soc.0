Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150945A293
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679246; cv=none; b=SgvLDhgBvPSiFm/rby1xyIDKIy784JyVGqk7C4FYAULUd2Ey/vg8KNxkFZRNTmDLibYSTmoGAHH/3XP23Hrmgzye1/ev9Fvfg2uLQy4dVftwgcb1RKi2j/rHw78OpCtwId6+MnrNuNKs0duIFYA1fQoFSabPznJ/z6K1xGVRslY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679246; c=relaxed/simple;
	bh=5UVbgppF7oUBXGxFCjSlq5azq+NDLwQ+sGuLF1xK0V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auCOhR7wsh/Zg0Drjmo8CcB92NGHmzIIenhvAaUseTYBAZgqHS3xa1r1DUIBxc6shtAXPBU2sBDHule2XPCPUKyVmIxMvhZ0A79kO4wyQAlGZFMHAoY4WHrCfVpltLO8n10yFjwX6FS9eD7dA63AMy6CwBBCqMLuhqsX3OrPXOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e9QC2fXy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e9QC2fXy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1F872EC;
	Thu, 17 Sep 2026 23:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789679141;
	bh=5UVbgppF7oUBXGxFCjSlq5azq+NDLwQ+sGuLF1xK0V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9QC2fXyryGt7qdvJItY83kYLB5nM9X4Sd1xQjtYu/ZtVlN3YQdFsSRh69Vy09f6+
	 VM6oRToDncaCCdb7b0k58cHf+nRFMjELZ/tteX7QcGFRgYmukeaWCB95ZP1VntkNcM
	 2P3dMerIYYQnTIXtqIqXDHpn7ClTHTqS+ZqCMq3s=
Date: Fri, 18 Sep 2026 00:07:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] src: gen-image: Fix compiler warning
Message-ID: <20260917210722.GC24505@killaraus.ideasonboard.com>
References: <20260917101912.3891324-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917101912.3891324-1-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Thu, Sep 17, 2026 at 07:19:12PM +0900, Paul Elder wrote:
> Fix compiler warning for maybe uninitialized.

It's useful to record more detailed information when working around
compiler issues. I'll expand the commit message to


gcc reports an uninitialized variable when compiling with '-Os':

In function ‘process’,
    inlined from ‘main’ at ../src/gen-image.c:2359:8:
../src/gen-image.c:1722:12: error: ‘image’ may be used uninitialized [-Werror=maybe-uninitialized]
 1722 |         if (!input) {
      |            ^
../src/gen-image.c: In function ‘main’:
../src/gen-image.c:389:23: note: ‘image’ was declared here
  389 |         struct image *image;
      |                       ^~~~~

This appears to be a false positive. Work around it by initializing the
image variable to NULL when declaring it.

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  src/gen-image.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/gen-image.c b/src/gen-image.c
> index 26d7f0d28417..401e1316ae5a 100644
> --- a/src/gen-image.c
> +++ b/src/gen-image.c
> @@ -386,7 +386,7 @@ static int pnm_read_integer(int fd)
>  
>  static struct image *pnm_read(const char *filename)
>  {
> -	struct image *image;
> +	struct image *image = NULL;
>  	unsigned int width;
>  	unsigned int height;
>  	char buffer[2];

-- 
Regards,

Laurent Pinchart
