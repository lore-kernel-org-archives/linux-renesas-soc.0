Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:56167 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751246AbdGLKno (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 06:43:44 -0400
Subject: [PATCH v2 07/16] drm/rcar-du: Use new iterator macros, v2.
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20170712081344.25495-1-maarten.lankhorst@linux.intel.com>
 <20170712081344.25495-8-maarten.lankhorst@linux.intel.com>
 <20170712091540.rnjldq4bbdiqrcur@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <485c9b80-43da-a8d0-6379-3620fddd8334@linux.intel.com>
Date: Wed, 12 Jul 2017 12:43:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170712091540.rnjldq4bbdiqrcur@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Op 12-07-17 om 11:15 schreef Daniel Vetter:
> On Wed, Jul 12, 2017 at 10:13:35AM +0200, Maarten Lankhorst wrote:
>> for_each_obj_in_state is about to be removed, so use the correct new
>> iterator macros.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: linux-renesas-soc@vger.kernel.org
> Looks correct, but I think Laurent has a patch to rework/remove this.
> Found something below anyway.
>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 41 ++++++++++++++++-----------------
>>  1 file changed, 20 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> index dcde6288da6c..dfd84e3c8c25 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> @@ -51,12 +51,9 @@
>>   */
>>  
>>  static bool rcar_du_plane_needs_realloc(struct rcar_du_plane *plane,
>> +					const struct rcar_du_plane_state *cur_state,
>>  					struct rcar_du_plane_state *new_state)
>>  {
>> -	struct rcar_du_plane_state *cur_state;
>> -
>> -	cur_state = to_rcar_plane_state(plane->plane.state);
>> -
>>  	/* Lowering the number of planes doesn't strictly require reallocation
>>  	 * as the extra hardware plane will be freed when committing, but doing
>>  	 * so could lead to more fragmentation.
>> @@ -141,16 +138,17 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  	unsigned int groups = 0;
>>  	unsigned int i;
>>  	struct drm_plane *drm_plane;
>> -	struct drm_plane_state *drm_plane_state;
>> +	struct drm_plane_state *old_drm_plane_state, *new_drm_plane_state;
>>  
>>  	/* Check if hardware planes need to be reallocated. */
>> -	for_each_plane_in_state(state, drm_plane, drm_plane_state, i) {
>> -		struct rcar_du_plane_state *plane_state;
>> +	for_each_oldnew_plane_in_state(state, drm_plane, old_drm_plane_state, new_drm_plane_state, i) {
>> +		struct rcar_du_plane_state *old_plane_state, *new_plane_state;
>>  		struct rcar_du_plane *plane;
>>  		unsigned int index;
>>  
>>  		plane = to_rcar_plane(drm_plane);
>> -		plane_state = to_rcar_plane_state(drm_plane_state);
>> +		old_plane_state = to_rcar_plane_state(old_drm_plane_state);
>> +		new_plane_state = to_rcar_plane_state(new_drm_plane_state);
>>  
>>  		dev_dbg(rcdu->dev, "%s: checking plane (%u,%tu)\n", __func__,
>>  			plane->group->index, plane - plane->group->planes);
>> @@ -159,19 +157,19 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  		 * the full reallocation procedure. Just mark the hardware
>>  		 * plane(s) as freed.
>>  		 */
>> -		if (!plane_state->format) {
>> +		if (!new_plane_state->format) {
>>  			dev_dbg(rcdu->dev, "%s: plane is being disabled\n",
>>  				__func__);
>>  			index = plane - plane->group->planes;
>>  			group_freed_planes[plane->group->index] |= 1 << index;
>> -			plane_state->hwindex = -1;
>> +			new_plane_state->hwindex = -1;
>>  			continue;
>>  		}
>>  
>>  		/* If the plane needs to be reallocated mark it as such, and
>>  		 * mark the hardware plane(s) as free.
>>  		 */
>> -		if (rcar_du_plane_needs_realloc(plane, plane_state)) {
>> +		if (rcar_du_plane_needs_realloc(plane, old_plane_state, new_plane_state)) {
>>  			dev_dbg(rcdu->dev, "%s: plane needs reallocation\n",
>>  				__func__);
>>  			groups |= 1 << plane->group->index;
>> @@ -179,7 +177,7 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  
>>  			index = plane - plane->group->planes;
>>  			group_freed_planes[plane->group->index] |= 1 << index;
>> -			plane_state->hwindex = -1;
>> +			new_plane_state->hwindex = -1;
>>  		}
>>  	}
>>  
>> @@ -226,16 +224,16 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  				continue;
>>  			}
>>  
>> -			plane_state = to_rcar_plane_state(plane->plane.state);
>> +			new_plane_state = to_rcar_plane_state(plane->plane.state);
>>  			used_planes |= rcar_du_plane_hwmask(plane_state);
>>  
>>  			dev_dbg(rcdu->dev,
>>  				"%s: plane (%u,%tu) uses %u hwplanes (index %d)\n",
>>  				__func__, plane->group->index,
>>  				plane - plane->group->planes,
>> -				plane_state->format ?
>> -				plane_state->format->planes : 0,
>> -				plane_state->hwindex);
>> +				new_plane_state->format ?
>> +				new_plane_state->format->planes : 0,
>> +				new_plane_state->hwindex);
>>  		}
>>  
>>  		group_free_planes[index] = 0xff & ~used_planes;
>> @@ -246,15 +244,16 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  	}
>>  
>>  	/* Reallocate hardware planes for each plane that needs it. */
>> -	for_each_plane_in_state(state, drm_plane, drm_plane_state, i) {
>> -		struct rcar_du_plane_state *plane_state;
>> +	for_each_oldnew_plane_in_state(state, drm_plane, old_drm_plane_state, new_drm_plane_state, i) {
>> +		struct rcar_du_plane_state *old_plane_state, *new_plane_state;
>>  		struct rcar_du_plane *plane;
>>  		unsigned int crtc_planes;
>>  		unsigned int free;
>>  		int idx;
>>  
>>  		plane = to_rcar_plane(drm_plane);
>> -		plane_state = to_rcar_plane_state(drm_plane_state);
>> +		old_plane_state = to_rcar_plane_state(old_drm_plane_state);
>> +		new_plane_state = to_rcar_plane_state(new_drm_plane_state);
>>  
>>  		dev_dbg(rcdu->dev, "%s: allocating plane (%u,%tu)\n", __func__,
>>  			plane->group->index, plane - plane->group->planes);
>> @@ -263,7 +262,7 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  		 * reallocated.
>>  		 */
>>  		if (!plane_state->format ||
> I think you missed a few cases of replacing plane_state here. Does this
> compile?
I fear not..

Have a working patch below. :)

----8<------
for_each_obj_in_state is about to be removed, so use the correct new
iterator macros.

Also look at new_plane_state instead of plane->state when looking up
the hw planes in use. They should be the same except when reallocating,
(in which case this code is skipped) and we should really stop looking
at obj->state whenever possible.

Changes since v1:
- Actually compile correctly.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 57 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index dcde6288da6c..50fd793c38d1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -51,12 +51,9 @@
  */
 
 static bool rcar_du_plane_needs_realloc(struct rcar_du_plane *plane,
+					const struct rcar_du_plane_state *cur_state,
 					struct rcar_du_plane_state *new_state)
 {
-	struct rcar_du_plane_state *cur_state;
-
-	cur_state = to_rcar_plane_state(plane->plane.state);
-
 	/* Lowering the number of planes doesn't strictly require reallocation
 	 * as the extra hardware plane will be freed when committing, but doing
 	 * so could lead to more fragmentation.
@@ -141,16 +138,17 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 	unsigned int groups = 0;
 	unsigned int i;
 	struct drm_plane *drm_plane;
-	struct drm_plane_state *drm_plane_state;
+	struct drm_plane_state *old_drm_plane_state, *new_drm_plane_state;
 
 	/* Check if hardware planes need to be reallocated. */
-	for_each_plane_in_state(state, drm_plane, drm_plane_state, i) {
-		struct rcar_du_plane_state *plane_state;
+	for_each_oldnew_plane_in_state(state, drm_plane, old_drm_plane_state, new_drm_plane_state, i) {
+		struct rcar_du_plane_state *old_plane_state, *new_plane_state;
 		struct rcar_du_plane *plane;
 		unsigned int index;
 
 		plane = to_rcar_plane(drm_plane);
-		plane_state = to_rcar_plane_state(drm_plane_state);
+		old_plane_state = to_rcar_plane_state(old_drm_plane_state);
+		new_plane_state = to_rcar_plane_state(new_drm_plane_state);
 
 		dev_dbg(rcdu->dev, "%s: checking plane (%u,%tu)\n", __func__,
 			plane->group->index, plane - plane->group->planes);
@@ -159,19 +157,19 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 		 * the full reallocation procedure. Just mark the hardware
 		 * plane(s) as freed.
 		 */
-		if (!plane_state->format) {
+		if (!new_plane_state->format) {
 			dev_dbg(rcdu->dev, "%s: plane is being disabled\n",
 				__func__);
 			index = plane - plane->group->planes;
 			group_freed_planes[plane->group->index] |= 1 << index;
-			plane_state->hwindex = -1;
+			new_plane_state->hwindex = -1;
 			continue;
 		}
 
 		/* If the plane needs to be reallocated mark it as such, and
 		 * mark the hardware plane(s) as free.
 		 */
-		if (rcar_du_plane_needs_realloc(plane, plane_state)) {
+		if (rcar_du_plane_needs_realloc(plane, old_plane_state, new_plane_state)) {
 			dev_dbg(rcdu->dev, "%s: plane needs reallocation\n",
 				__func__);
 			groups |= 1 << plane->group->index;
@@ -179,7 +177,7 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 
 			index = plane - plane->group->planes;
 			group_freed_planes[plane->group->index] |= 1 << index;
-			plane_state->hwindex = -1;
+			new_plane_state->hwindex = -1;
 		}
 	}
 
@@ -204,7 +202,7 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 
 		for (i = 0; i < group->num_planes; ++i) {
 			struct rcar_du_plane *plane = &group->planes[i];
-			struct rcar_du_plane_state *plane_state;
+			struct rcar_du_plane_state *new_plane_state;
 			struct drm_plane_state *s;
 
 			s = drm_atomic_get_plane_state(state, &plane->plane);
@@ -226,16 +224,16 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 				continue;
 			}
 
-			plane_state = to_rcar_plane_state(plane->plane.state);
-			used_planes |= rcar_du_plane_hwmask(plane_state);
+			new_plane_state = to_rcar_plane_state(s);
+			used_planes |= rcar_du_plane_hwmask(new_plane_state);
 
 			dev_dbg(rcdu->dev,
 				"%s: plane (%u,%tu) uses %u hwplanes (index %d)\n",
 				__func__, plane->group->index,
 				plane - plane->group->planes,
-				plane_state->format ?
-				plane_state->format->planes : 0,
-				plane_state->hwindex);
+				new_plane_state->format ?
+				new_plane_state->format->planes : 0,
+				new_plane_state->hwindex);
 		}
 
 		group_free_planes[index] = 0xff & ~used_planes;
@@ -246,15 +244,16 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 	}
 
 	/* Reallocate hardware planes for each plane that needs it. */
-	for_each_plane_in_state(state, drm_plane, drm_plane_state, i) {
-		struct rcar_du_plane_state *plane_state;
+	for_each_oldnew_plane_in_state(state, drm_plane, old_drm_plane_state, new_drm_plane_state, i) {
+		struct rcar_du_plane_state *old_plane_state, *new_plane_state;
 		struct rcar_du_plane *plane;
 		unsigned int crtc_planes;
 		unsigned int free;
 		int idx;
 
 		plane = to_rcar_plane(drm_plane);
-		plane_state = to_rcar_plane_state(drm_plane_state);
+		old_plane_state = to_rcar_plane_state(old_drm_plane_state);
+		new_plane_state = to_rcar_plane_state(new_drm_plane_state);
 
 		dev_dbg(rcdu->dev, "%s: allocating plane (%u,%tu)\n", __func__,
 			plane->group->index, plane - plane->group->planes);
@@ -262,8 +261,8 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 		/* Skip planes that are being disabled or don't need to be
 		 * reallocated.
 		 */
-		if (!plane_state->format ||
-		    !rcar_du_plane_needs_realloc(plane, plane_state))
+		if (!new_plane_state->format ||
+		    !rcar_du_plane_needs_realloc(plane, old_plane_state, new_plane_state))
 			continue;
 
 		/* Try to allocate the plane from the free planes currently
@@ -271,15 +270,15 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 		 * group and thus minimize flicker. If it fails fall back to
 		 * allocating from all free planes.
 		 */
-		crtc_planes = to_rcar_crtc(plane_state->state.crtc)->index % 2
+		crtc_planes = to_rcar_crtc(new_plane_state->state.crtc)->index % 2
 			    ? plane->group->dptsr_planes
 			    : ~plane->group->dptsr_planes;
 		free = group_free_planes[plane->group->index];
 
-		idx = rcar_du_plane_hwalloc(plane, plane_state,
+		idx = rcar_du_plane_hwalloc(plane, new_plane_state,
 					    free & crtc_planes);
 		if (idx < 0)
-			idx = rcar_du_plane_hwalloc(plane, plane_state,
+			idx = rcar_du_plane_hwalloc(plane, new_plane_state,
 						    free);
 		if (idx < 0) {
 			dev_dbg(rcdu->dev, "%s: no available hardware plane\n",
@@ -288,12 +287,12 @@ int rcar_du_atomic_check_planes(struct drm_device *dev,
 		}
 
 		dev_dbg(rcdu->dev, "%s: allocated %u hwplanes (index %u)\n",
-			__func__, plane_state->format->planes, idx);
+			__func__, new_plane_state->format->planes, idx);
 
-		plane_state->hwindex = idx;
+		new_plane_state->hwindex = idx;
 
 		group_free_planes[plane->group->index] &=
-			~rcar_du_plane_hwmask(plane_state);
+			~rcar_du_plane_hwmask(new_plane_state);
 
 		dev_dbg(rcdu->dev, "%s: group %u free planes mask 0x%02x\n",
 			__func__, plane->group->index,
-- 
2.11.0
