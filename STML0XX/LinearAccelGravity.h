/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Copyright (C) 2015 Motorola Mobility LLC
 */

#ifndef LINEAR_ACCEL_GRAVITY_H
#define LINEAR_ACCEL_GRAVITY_H

#include <stdint.h>
#include "FusionSensorBase.h"

class LinearAccelGravity : public FusionSensorBase {
public:
    LinearAccelGravity();
    virtual ~LinearAccelGravity();

    static LinearAccelGravity* getInstance();

    void setGameRVData(float x, float y, float z, float ext1, int64_t ts);
    void processFusion();

private:
    static LinearAccelGravity self;
    float gameRVData[4];
    int64_t gameRVts;
};

#endif // LINEAR_ACCEL_GRAVITY_H